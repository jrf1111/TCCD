# Convert Terms to a numeric value for calculations.


#' @title Term_num
#'
#'
#' @param TERM_ID A term character or factor code with values such as "2019FL" or "2010SU".
#' @description Converts terms to a numeric value for calculations.  Based on `Convert STCTERM to numeric value.sps`.
#' @export
Term_num = function(TERM_ID){


	TERM_ID = tibble::tibble(TERM_ID = TERM_ID)

	mtable = tibble::tibble(TERM_ID =  paste0(rep(2004:2050, each=3), c("SP", "SU", "FL")),
													term_num = 1:length(TERM_ID)
													)

	res = plyr::join(TERM_ID, mtable, by = "TERM_ID", match = "first")

	res$term_num

}




#' @title Term
#'
#' @param TERM_ID A term character or factor code with values such as  "2019FL" or "2010SU"
#' @description Converts semester term codes to their English equivalent.  Based on `Convert STCTERM to numeric value.sps`.
#'
#' @examples
#' Term("2019FL")  #Fall
#' Term("2010SU")  #Summer
#' Term("2011SP")  #Spring
#' Term("2011S")  #2011S - Doesn't match the pattern
#' @export
Term = function(TERM_ID){

	res = TERM_ID
	res = gsub(".*?SP", "Spring", res)
	res = gsub(".*?FL", "Fall", res)
	res = gsub(".*?SU", "Summer", res)
	res

}
