.rice_en <- function(rice, labels_only = FALSE, as_labelled = FALSE) {
  rice <- labelise(rice, self = FALSE,
    label = list(
      area               = "Area",
      perimeter          = "Perimeter",
      major_axis_length  = "Major axis length",
      minor_axis_length  = "Minor axis length",
      eccentricity       = "Eccentricity",
      convex_area        = "Convex area",
      extent             = "Extent",
      class              = "Class"),
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
