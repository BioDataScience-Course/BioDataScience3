# Input solution for the challenge and get ranking
# ================================================
# Note: the shared folder is created like this using SSH onto the server
# cd /data1
# sudo mkdir C03_challenge
# sudo chown rstudio-connect: C03_challenge
# Then, put wine2quality.rds (from sdd_preparation ) into that directory
# scp wine2quality.rds econum@sdd.umons.ac.be:.
# sudo mv /home/econum/wine2quality.rds /data1/C03_challenge
# sudo chown rstudio-connect:/data1/C03_challenge/wine2quality.rds

# We also need flipdown from:
#remotes::install_github("feddelegrand7/flipdownr")

library(data.io)
library(mlearning)
library(RSQLite)
library(flipdownr)

# Indicate title and deadline here
title <- "Challenge vins"
deadline <- "2020-11-16 20:00:00"

# Read data from the SQLite database
dir <- "/data1/C03_challenge"
if (!file.exists(dir))
  dir <- "~/C03_challenge" # Alternate dir for local tests
database <- file.path(dir, "wine.sqlite")
table <- "wines"
wine2quality <- read$rds(file.path(dir, "wine2quality.rds"))$value

# Is the countdown over?
is_done <- function()
  as.POSIXct(deadline) < Sys.time()

# The function that calculates score and returns also a message
score_model <- function(x, reference = wine2quality) {
  if (!is.factor(x))
    return(structure(NA,
      message = "Le fichier doit contenir un objet de classe 'factor'. Corrigez et resoumettez !"))
  if (length(x) != length(reference))
    return(structure(NA,
      message = paste("Le r\u00e9sultat doit contenir", length(reference),
        "items, or vous en fournissez", length(x), ". Corrigez et resoumettez !")))
  if (!"excellent" %in% levels(x))
    return(structure(NA,
      message = "Il faut un niveau de la variable 'factor' qui soit nomm\u00e9 'excellent'. Corrigez et resoumettez !"))
  # In case of a recoding , we contrast "excellent" with the rest
  wine_pred2 <-
    c("autre", "excellent")[(as.character(x) == "excellent") + 1]
  wine_true2 <-
    c("autre", "excellent")[(as.character(reference) == "excellent") + 1]
  res <- summary(confusion(as.factor(wine_pred2), as.factor(wine_true2)))
  #res
  # Precision for 'excellent' must by higher than 25%
  prec <- res["excellent", "Precision"]
  if (prec < 0.25)
    return(structure(NA,
      message = paste0("La pr\u00e9cision pour la classe 'excellent' ne peut pas \u00eatre en dessous de 25% et vous avez ",
        round(prec * 100, 1), "%. Votre proposition n'est pas retenue !")))
  # Le classement du modèle se fait sur base du rappel pour la classe "excellent"
  recall <- res["excellent", "Recall"]
  score <- recall * 100 # In  percents
  structure(score,
    message = paste0("Votre proposition est accept\u00e9e. Son score est de ",
    round(score, 3), "."))
}

# Manage results into the SQLite database
empty_data <- function()
  data.frame(project = character(0), model = character(0),
    date = as.POSIXct(character(0)), score = numeric(0))

save_data <- function(data) {
  # Connect to the database
  db <- dbConnect(SQLite(), database)
  # Make sure table exists in the database
  try(dbWriteTable(db, table, empty_data()), silent = TRUE)
  # Construct the update query by looping over the data fields
  query <- sprintf(
    "INSERT INTO %s (%s) VALUES ('%s')",
    table,
    paste(names(data), collapse = ", "),
    paste(data, collapse = "', '")
  )
  # Submit the update query and disconnect
  dbGetQuery(db, query)
  dbDisconnect(db)
}

load_data <- function() {
  # Connect to the database
  db <- dbConnect(SQLite(), database)
  # Construct the fetching query
  query <- sprintf("SELECT * FROM %s", table)
  # Submit the fetch query and disconnect
  data <- try(dbGetQuery(db, query), silent = TRUE)
  dbDisconnect(db)
  if (inherits(data, "try-error")) {
    empty_data()
  } else {
    data
  }
}

ui <- fluidPage(
  titlePanel(title),

  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Votre proposition (fichier RDS)", accept = ".rds"),
      textOutput("message")
    ),
    mainPanel(
      h3("Temps restant pour le challenge :"),
      flipdown(downto = deadline, id = "csfrench", theme = "dark",
        headings = c("jours", "heures", "minutes", "secondes")),
      hr(),
      h3("Classement :"),
      tableOutput("ranking")
    )
  )
)

server <- function(input, output) {
  output$message <- renderText({
    file <- input$file
    ext <- tools::file_ext(file$datapath)
    req(file)
    validate(need(ext == "rds", "Vous devez indiquer un fichier RDS"))
    # Check that there is still time remaining
    if (is_done()) {
      "Ce challenge est fini, vous ne pouvez plus soumettre de proposition !"
    } else {
      # Check that filename is correct (repos__model.rds)
      if (!grepl("^.+__.+\\.rds", file$name)) {
        "Le nom de votre fichier est incorrect : il faut <repos>__<model>.rds. Corrigez et resoumettez."
      } else {
        solution <- data.io::read$rds(file$datapath)$value
        # Check if a model of the same name already exists
        name <- file$name
        project <- sub("(^.+)__.+$", "\\1", name)
        model <- sub(("^.+__(.+)\\.rds$"), "\\1", name)
        ranking <- load_data()
        if (NROW(ranking[ranking$project == project & ranking$model == model, ])) {
          "Un mod\u00e8le de m\u00eame nom existe dans le classement, changez le nom avant de soumettre une nouvelle variante."
        } else {
          attr(score_model(solution), "message")
        }
      }
    }
  })

  output$ranking <- renderTable({
    file <- input$file
    if (!is.null(file$datapath) && grepl("^.+__.+\\.rds", file$name) &&
      !is_done()) {
      solution <- data.io::read$rds(file$datapath)$value
      score <- score_model(solution)
      name <- file$name
      project <- sub("(^.+)__.+$", "\\1", name)
      model <- sub(("^.+__(.+)\\.rds$"), "\\1", name)
    } else {
      score <- NA
    }
    ranking <- load_data()
    # Record an entry in the mongoDB database
    # But we need the login of *all* members of the team, and we don't have them
    # right now => leave this to a post-process task instead!
    if (!is.na(score)) {
      # Check if it is not submitted yet
      if (!NROW(ranking[ranking$project == project & ranking$model == model, ])) {
        save_data(list(
          project = project, model = model, date = Sys.time(),
          score = as.numeric(score)
        ))
        # Reload the full dataset
        ranking <- load_data()
      }
    }
    # Rework the ranking table
    if (NROW(ranking)) {
      ranking <- ranking[order(-ranking$score, as.numeric(ranking$date)), ]
      ranking$date <- as.POSIXct(ranking$date, origin = "1960-01-01")
      ranking$date <- format(ranking$date, "%Y-%m-%d %H:%M:%S")
    }
    # Add a column with medals for the three first results
    n <- NROW(ranking)
    if (n == 0) {
      medals <- character(0)
    } else {
      medals <- c("\U1F947", "\U1F948", "\U1F949")
      if (n < 4) {
        medals <- medals[1:n]
      } else {
        medals <- c(medals, rep("", 1:(n - 3)))
      }
    }
    ranking <- data.frame(rank = medals, ranking)
    names(ranking) <- c("", "Projet", "Mod\u00e8le", "Date", "Score")
    ranking
  })
}

shinyApp(ui, server)
