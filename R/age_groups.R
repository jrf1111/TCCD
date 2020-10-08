#' Age groups
#'
#' @param age The students' ages
#'
#' @return a factor of age groups
#' @export
#'
#' @details The recoded age groups are Under 21, 21-25, 26-30, 31-35, 36-40, and 41 and above.
#'
#'
age_groups = function(age) {
	res = dplyr::case_when(
		age	< 21 ~ "Under 21",
		dplyr::between(age, 21, 25 + (1 - 1e-10)) ~ "21-25",
		dplyr::between(age, 26, 30 + (1 - 1e-10)) ~ "26-30",
		dplyr::between(age, 31, 35 + (1 - 1e-10)) ~ "31-35",
		dplyr::between(age, 36, 40 + (1 - 1e-10)) ~ "36-40",
		age	>= 41 ~ "41 and above"
	)

	res = factor(res,
							 levels = c("Under 21", "21-25",
							 					 "26-30", "31-35",
							 					 "36-40", "41 and above"))

	res
}
