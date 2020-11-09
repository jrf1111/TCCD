#' Convert Terms to a numeric value for calculations.
#'
#' @title Term_num
#'
#'
#' @param TERM_ID A term character or factor code with values such as "2019FL" or "2010SU".
#' @description Converts terms to a numeric value for calculations.  Based on `Convert STCTERM to numeric value.sps`.
#' @export
term_num = function(TERM_ID){


	TERM_ID = tibble::tibble(TERM_ID = TERM_ID)

	mtable = tibble::tibble(TERM_ID =  paste0(rep(2004:2050, each = 3), c("SP", "SU", "FL")),
													term_num = 1:length(TERM_ID)
													)

	res = plyr::join(TERM_ID, mtable, by = "TERM_ID", match = "first")

	res$term_num

}




#' @title Term name
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
Term_name = function(TERM_ID){

	res = TERM_ID
	res = gsub(".*?SP", "Spring", res)
	res = gsub(".*?FL", "Fall", res)
	res = gsub(".*?SU", "Summer", res)
	res

}





#' Get factor-ized terms
#'
#' @description `factor_term()` takes a Term column/variable and returns it as a factor for sorting purposes.
#'
#' @param Term A variable containing academic terms.
#' @param drop Character. How should term levels not seen in the data be handled? Default is `drop = "outside"`, which removes term levels outside of the range seen in the data but keeps unobserved terms occurring between the first and last observed terms. Using `drop = "all"` removes all term levels that are not present in the data (may create 'gaps' in the term levels).  Using `drop = "none"` will keep all term levels between 2004SP and 2050Q2.
#' @param Qs Logical.  Should quarters be included in the term levels? Overrides the `drop` argument.
#'
#' @return A factor with the term levels ordered to allow sorting.
#'
#' @examples
#'
#' @export
factor_term = function(Term, drop = c("outside", "all", "none"), Qs = TRUE){

	drop = match.arg(drop)

	levels = paste0(rep(2004:2050, each = 7), c("SP", "Q3", "Q4", "SU", "FL", "Q1", "Q2"))

	Term = factor(Term, levels = levels)

	if(drop == "all"){
		Term = droplevels(Term)
	}

	if(drop == "outside"){
		first = as.character(sort(Term)[1])
		start = which(levels == first)
		last = as.character(sort(Term, decreasing = TRUE)[1])
		end = which(levels == last)
		levels = levels[start:end]
		Term = factor(Term, levels = levels)
	}

	if(Qs == FALSE){
		levels = levels(Term)
		levels = levels[!grepl("Q", levels)]
		Term = factor(Term, levels = levels)
	}



	Term
}
