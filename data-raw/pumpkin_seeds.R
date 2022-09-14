# Pumpkins seeds Data Set
pumpkins <- data.io::read(file = "data-raw/pumpkin_seeds.rds")
## rename variable
vars <- tolower(names(pumpkins))
vars[vars == "aspect_ration"] <- "aspect_ratio"
names(pumpkins) <- vars

## change factor levels
pumpkins$class[pumpkins$class == "Çerçevelik"] <- "Cercevelik"
pumpkins$class[pumpkins$class == "Ürgüp Sivrisi"] <- "Urgup Sivrisi"
pumpkins$class <- as.factor(pumpkins$class)

# write data
usethis::use_data(pumpkins, overwrite = TRUE)
