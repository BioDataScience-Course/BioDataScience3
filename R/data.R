#' Rice Dataset Commeo and Osmancik
#'
#' A total of 3810 rice grain's images were taken for the two species (Cammeo and Osmancik),
#' processed and feature inferences were made. Seven morphological features were obtained for each grain of rice.
#'
#' @format A data frame with 8 variables and 3810 observations:
#' \describe{
#'   \item{\code{area}}{The  number  of  pixels  within  the boundaries of the rice grain.}
#'   \item{\code{perimeter}}{The perimeter of the rice grain.}
#'   \item{\code{major_axis_length}}{The longest line that can be drawn on the rice  grain.}
#'   \item{\code{minor_axis_length}}{The shortest line that can be drawn on the rice  grain.}
#'   \item{\code{eccentricity}}{It measures how round the ellipse, which has  the  same  moments  as  the  rice  grain, is.}
#'   \item{\code{convex_area}}{The the  pixel  count  of  the  smallest convex shell of the region formed by the rice grain.}
#'   \item{\code{extent}}{the ratio of the region formed by the rice grain to the bounding box pixels.}
#'   \item{\code{class}}{A **factor** with two levels: `"Cammeo"`, and `"Osmancik"`.}
#' }
#' @source {Cinar, I. and Koklu, M. (2019). Classification of Rice Varieties Using Artificial Intelligence Methods. International Journal of Intelligent Systems and Applications in Engineering, vol.7, no.3 (Sep. 2019), pp.188-194. doi:10.18201/ijisae.2019355381}
"rice"

#' Pumpkin seeds Dataset
#'
#' A total of 2500 pumpkin seed's images were taken for the two species (Çerçevelik and Ürgüp Sivrisi),
#' processed and feature inferences were made. 12 morphological features were obtained for each pumpkin seeds.
#'
#' @format A data frame with 13 variables and 2500 observations:
#' \describe{
#'   \item{\code{area}}{The number of pixels within the borders of a pumpkin seed.}
#'   \item{\code{perimeter}}{The circumference in pixels of a pumpkin seed.}
#'   \item{\code{major_axis_length}}{The maximal axis distance of a pumpkin seed.}
#'   \item{\code{minor_axis_length}}{The small axis distance of a pumpkin seed.}
#'   \item{\code{convex_area}}{The ratio of a pumpkin seed area to the bounding box pixels.}
#'   \item{\code{equiv_diameter}}{The area of the pumpkin seed by four and dividing by the number pi, and taking the square root.}
#'   \item{\code{eccentricity}}{The eccentricity of a pumpkin seed.}
#'   \item{\code{solidity}}{The convex condition of the pumpkin seeds.}
#'   \item{\code{extent}}{The ratio of a pumpkin seed area to the bounding box pixels.}
#'   \item{\code{roundness}}{The ovality of pumpkin seeds without considering its distortion of the edges.}
#'   \item{\code{aspect_ratio}}{The aspect ratio of the pumpkin seeds.}
#'   \item{\code{compactness}}{The area of the pumpkin seed relative to the area of the circle with the same circumference.}
#'   \item{\code{class}}{A **factor** with two levels: `"Cercevelik"`, and `"Urgup Sivrisi"`.}
#' }
#' @source {KOKLU, M., SARIGIL, S. and OZBEK, O. (2021). The use of machine learning methods in classification of pumpkin seeds (Cucurbita pepo L.). Genetic Resources and Crop Evolution, 68(7), 2713-2726. doi:10.1007/s10722-021-01226-0}
"pumpkins"
