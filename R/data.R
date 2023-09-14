#' Rice Dataset Commeo and Osmancik
#'
#' @description
#' A total of 3810 images of rice grains were taken for two varieties (Cammeo
#' and Osmancik). The images are then processed and feature were extracted in a
#' table. Seven morphological features were obtained for each grain of rice.
#'
#' @format A data frame with 8 variables and 3810 observations:
#' \describe{
#'   \item{\code{area}}{The number of pixels within the boundaries of the rice
#'     grain.}
#'   \item{\code{perimeter}}{The perimeter of the rice grain.}
#'   \item{\code{major_axis_length}}{The longest line that can be drawn on the
#'     rice grain.}
#'   \item{\code{minor_axis_length}}{The shortest line that can be drawn on the
#'     rice grain.}
#'   \item{\code{eccentricity}}{It measures how round the ellipse, which has the
#'     same moments as the rice grain.}
#'   \item{\code{convex_area}}{The pixel count of the smallest convex hull of
#'     the region formed by the rice grain.}
#'   \item{\code{extent}}{the ratio of the region formed by the rice grain to
#'     the bounding box pixels.}
#'   \item{\code{class}}{A **factor** with two levels: `"Cammeo"`, and
#'     `"Osmancik"`.}
#' }
#' @source {Cinar, I. and Koklu, M. (2019). Classification of Rice Varieties
#'   Using Artificial Intelligence Methods. International Journal of Intelligent
#'   Systems and Applications in Engineering, vol.7, no.3 (Sep. 2019),
#'   pp.188-194. doi:10.18201/ijisae.2019355381}
"rice"

#' Pumpkin seeds Dataset
#'
#' @description
#' A total of 2500 images of pumpkin seed were taken for two varieties
#' (Çerçevelik and Ürgüp Sivrisi). The images were processed and feature were
#' calculated. Twelve morphological features were obtained for each pumpkin
#' seed.
#'
#' @format A data frame with 13 variables and 2500 observations:
#' \describe{
#'   \item{\code{area}}{The number of pixels within the borders of a pumpkin
#'     seed.}
#'   \item{\code{perimeter}}{The circumference in pixels of a pumpkin seed.}
#'   \item{\code{major_axis_length}}{The maximal axis distance of a pumpkin
#'     seed.}
#'   \item{\code{minor_axis_length}}{The small axis distance of a pumpkin seed.}
#'   \item{\code{convex_area}}{The ratio of a pumpkin seed area to the bounding
#'     box pixels.}
#'   \item{\code{equiv_diameter}}{The diameter of a cicle with same area as the
#'     pumpkin.}
#'   \item{\code{eccentricity}}{The eccentricity of a pumpkin seed.}
#'   \item{\code{solidity}}{The convex condition of the pumpkin seeds.}
#'   \item{\code{extent}}{The ratio of a pumpkin seed area to the bounding box
#'     pixels.}
#'   \item{\code{roundness}}{The ovality of pumpkin seeds without considering
#'     its distortion at the edges.}
#'   \item{\code{aspect_ratio}}{The aspect ratio of the pumpkin seeds.}
#'   \item{\code{compactness}}{The area of the pumpkin seed relative to the area
#'     of a circle with the same circumference.}
#'   \item{\code{class}}{A **factor** with two levels: `"Cercevelik"`, and
#'     `"Urgup Sivrisi"`.}
#' }
#' @source {Koklu, M., Sarigil, S. and Ozbek, O. (2021). The use of machine
#'   learning methods in classification of pumpkin seeds (Cucurbita pepo L.).
#'   Genetic Resources and Crop Evolution, 68(7), 2713-2726.
#'   doi:10.1007/s10722-021-01226-0}
"pumpkins"

#' Dermatology Dataset
#'
#' @description
#' This dataset contains 34 attributes studied on 366 patients to determine the
#' type of Eryhemato-Squamous Disease. Twelve attributes are the clinical data
#' and 22 attributes are the histopathological informations.
#'
#' @format A data frame with 35 variables and 366 observations:
#' \describe{
#'   \item{\code{erythema}}{Clinical attributes: erythema}
#'   \item{\code{scaling}}{Clinical attribute: scaling}
#'   \item{\code{definite_borders}}{Clinical attribute: definite borders}
#'   \item{\code{itching}}{Clinical attribute: itching}
#'   \item{\code{koebner_phenomenon}}{Clinical attribute: koebner phenomenon}
#'   \item{\code{polygonal_papules}}{Clinical attribute: polygonal papules}
#'   \item{\code{follicular_papules}}{Clinical attribute: follicular papules}
#'   \item{\code{oral_mucosal_involvement}}{Clinical attribute: oral mucosal
#'     involvement}
#'   \item{\code{knee_elbow_involvement}}{Clinical attribute: knee and elbow
#'     involvement}
#'   \item{\code{scalp_involvement}}{Clinical attribute: scalp involvement}
#'   \item{\code{family_history}}{Clinical attribute: family history}
#'   \item{\code{melanin_incontinence}}{Histopathological attribute: melanin
#'     incontinence}
#'   \item{\code{eosinophils_infiltrate}}{Histopathological attribute:
#'     eosinophils in the infiltrate}
#'   \item{\code{pnl_infiltrate}}{Histopathological attribute: PNL infiltrate}
#'   \item{\code{fibrosis_papillary_dermis}}{Histopathological attribute:
#'     fibrosis of the papillary dermis}
#'   \item{\code{exocytosis}}{Histopathological attribute: exocytosis}
#'   \item{\code{acanthosis}}{Histopathological attribute: acanthosis}
#'   \item{\code{hyperkeratosis}}{Histopathological attribute: hyperkeratosis}
#'   \item{\code{parakeratosis}}{Histopathological attribute: parakeratosis}
#'   \item{\code{clubbing_rete_ridges}}{Histopathological attribute: clubbing of
#'     the rete ridges}
#'   \item{\code{elongation_rete_ridges}}{Histopathological attribute:
#'     elongation of the rete ridges}
#'   \item{\code{thinning_suprapapillary_epidermis}}{Histopathological
#'     attribute: thinning of the suprapapillary epidermis}
#'   \item{\code{spongiform_pustule}}{Histopathological attribute: spongiform
#'     pustule}
#'   \item{\code{munro_microabcess}}{Histopathological attribute: munro
#'     microabcess}
#'   \item{\code{focal_hypergranulosis}}{Histopathological attribute: focal
#'     hypergranulosis}
#'   \item{\code{disappearance_granular_layer}}{Histopathological attribute:
#'     disappearance of the granular layer}
#'   \item{\code{vacuolisation_damage_basal_layer}}{Histopathological attribute:
#'     vacuolisation and damage of basal layer}
#'   \item{\code{spongiosis}}{Histopathological attribute: spongiosis}
#'   \item{\code{saw_tooth_appearance_retes}}{Histopathological attribute:
#'     saw-tooth appearance of retes}
#'   \item{\code{follicular_horn_plug}}{Histopathological attribute: follicular
#'     horn plug}
#'   \item{\code{perifollicular_parakeratosis}}{Histopathological attribute:
#'     perifollicular parakeratosis}
#'   \item{\code{inflammatory_monoluclear_inflitrate}}{Histopathological
#'     attribute: inflammatory monoluclear inflitrate}
#'   \item{\code{band_like_infiltrate}}{Histopathological attribute: band-like
#'     infiltrate}
#'   \item{\code{age}}{Histopathological attribute: age}
#'   \item{\code{class}}{A **factor** with six levels: `psoriasis`,
#'     `seboreic dermatitis`, `lichen planus`, `pityriasis rosea`,
#'     `cronic dermatitis`, `pityriasis rubra pilaris`.}
#'}
#'
#' @source {Ilter, Nilsel & Guvenir, H.. (1998). Dermatology. UCI Machine Learning Repository.}
"dermatology"
