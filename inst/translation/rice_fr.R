.rice_fr <- function(rice, labels_only = FALSE, as_labelled = FALSE) {
  rice <- labelise(rice, self = FALSE,
    label = list(
      area               = "Aire",
      perimeter          = "Perimètre",
      major_axis_length  = "Longueur de l'axe majeur",
      minor_axis_length  = "Longueur de l'axe mineur",
      eccentricity       = "Excentricité",
      convex_area        = "Aire convexe",
      extent             = "Extent",
      class              = "Classe"),
    units = list(
      area               = "px^2",
      perimeter          = "px",
      major_axis_length  = "px",
      minor_axis_length  = "px",
      eccentricity       = NA,
      convex_area        = NA,
      extent             = NA,
      class              = NA),
    as_labelled = as_labelled)

  #if (!isTRUE(labels_only)) {
  # Nothing to do
  #}

  rice
}
