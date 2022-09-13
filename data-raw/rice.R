# Rice (Cammeo and Osmancik) Data Set
rice <- data.io::read(file = "data-raw/rice.rds")
## rename variable
names(rice) <- tolower(names(rice))
# write data
usethis::use_data(rice, overwrite = TRUE)
