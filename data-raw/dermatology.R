# dermatology
# citation : Ilter, Nilsel & Guvenir, H.. (1998). Dermatology. UCI Machine Learning Repository.
# url for dataset
# https://archive.ics.uci.edu/ml/machine-learning-databases/dermatology/
# Dataset : https://archive.ics.uci.edu/ml/machine-learning-databases/dermatology/dermatology.data
# Dictionnary : https://archive.ics.uci.edu/ml/machine-learning-databases/dermatology/dermatology.names
derma <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/dermatology/dermatology.data", sep = ",")

# names of variables ----
vars <- c(
  "erythema", "scaling", "definite_borders",
  "itching", "koebner_phenomenon", "polygonal_papules",
  "follicular_papules", "oral_mucosal_involvement", "knee_elbow_involvement",
  "scalp_involvement", "family_history", "melanin_incontinence",
  "eosinophils_infiltrate", "pnl_infiltrate", "fibrosis_papillary_dermis",
  "exocytosis", "acanthosis", "hyperkeratosis",
  "parakeratosis", "clubbing_rete_ridges", "elongation_rete_ridges",
  "thinning_suprapapillary_epidermis", "spongiform_pustule", "munro_microabcess",
  "focal_hypergranulosis", "disappearance_granular_layer", "vacuolisation_damage_basal_layer",
  "spongiosis", "saw_tooth_appearance_retes", "follicular_horn_plug",
  "perifollicular_parakeratosis", "inflammatory_monoluclear_inflitrate", "band_like_infiltrate",
  "age", "class")

names(derma) <- vars
#derma <- janitor::clean_names(derma)
# Rework variable
derma$age[derma$age =="?"] <- NA

derma$class <- factor(derma$class, levels= 1:6, labels = c(
  "psoriasis", "seboreic dermatitis", "lichen planus",
  "pityriasis rosea", "cronic dermatitis", "pityriasis rubra pilaris")
  )

dermatology <- derma
# write data
usethis::use_data(dermatology, overwrite = TRUE)
