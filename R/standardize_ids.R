#' Standardize the length of ID strings
#'
#' @param id a numeric vector (or one that can be coerced to numeric) containing IDs
#' @param length a scalar integer indicating how long the result should be.  Default is 7.
#'
#' @description Standardizes the length of IDs (or other variables) by adding leading zeros.
#'
#' @return a character vector of IDs with leading zeros added
#'
#'
#' @export
standardize_ids = function(id, length = 7){


	na_pre = sum(is.na(id))
	res = as.numeric(id)
	na_post = sum(is.na(res))

	if(na_pre == na_post){
		res = formatC(res, width = length, flag = "0", format = "d")
		return(res)
	}

	if(na_pre != na_post){
		stop("Input argument 'id' could not safely be coerced to numeric. Returning input unchanged.")
		return(id)
	}



}
