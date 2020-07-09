#' Standardize the length of student ID strings
#'
#' @param id a numeric or character vector containing student IDs
#'
#' @return a character vector of student IDs with leading zeros added
#'
#'
#' @export
standardize_ids = function(id){
	res = dplyr::case_when(
		nchar(id) == 4 ~ paste0("000", id),
		nchar(id) == 5 ~ paste0("00", id),
		nchar(id) == 6 ~ paste0("0", id),
		TRUE ~ id
	)
	res
}
