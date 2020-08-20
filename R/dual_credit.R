#' Identify students in dual-credit programs
#'
#' @param Id Student ID
#' @param Program Academic program code, usually from ST Students Gender/Ethnicity by Program
#' @param term The academic term (e.g., 2020SP). This argument is optional if \code{term_num} is supplied.
#' @param term_num The numeric code corresponding to the academic term (e.g., 49 for 2020SP). This argument is optional if \code{term} is supplied.
#'
#' @return A data.frame containing \code{Id}, \code{Program},  \code{term_num},
#' \code{term} (if supplied),  a logical flag indicating if \code{Program} is a dual-credit program (\code{dual_credit}), a logical flag indicating if any of the programs the student took in each term where dual-credit programs (\code{any_dual_credit}), and a logical flag indicating if all of the programs the student took in each term where dual-credit programs (\code{all_dual_credit}).
#'
#'
#' @details The method to determine if a program is dual-credit is explained in this table:
# \tabular{lll}{
#		Term              \tab Program Code(s)   \tab Dual-credit?\cr
# 	2015FL and before \tab EHDC & EHSE       \tab Yes\cr
# 	2015FL and before \tab EHSE              \tab Yes\cr
# 	2015FL and before \tab EHDC              \tab Yes\cr
# 	2015FL and before \tab *ECHS* & EHDC     \tab No \cr
# 	2015FL and before \tab *ECHS* & EHSE     \tab No \cr
# 	2015FL and before \tab *ECHS*            \tab No \cr
# 	2015FL and before \tab None of the above \tab No \cr
# 	After 2015FL      \tab EHSE              \tab Yes\cr
# 	After 2015FL      \tab EHDC & EHSE       \tab Yes\cr
# 	After 2015FL      \tab *ECHS* & EHSE     \tab No \cr
# 	After 2015FL      \tab *ECHS*            \tab No \cr
# 	After 2015FL      \tab *ECHS* & EHDC     \tab No \cr
# 	After 2015FL      \tab EHDC              \tab No \cr
# 	After 2015FL      \tab None of the above \tab No
# }
#'
#' @export
dual_credit = function(Id, Program, term = NULL, term_num = NULL){

	if(is.null(term_num) & is.null(term)){
		stop("Must supply either term or term number")
	}

	if(is.null(Id)){
		stop("Must supply student ID")
	}

	if(is.null(Program)){
		stop("Must supply student Program codes")
	}


	if(is.null(term_num) & !is.null(term)){
		term_num = Term_num(term)
	}

	if(!is.numeric(term_num) & !is.null(term)){
		term_num = Term_num(term)
	}

	res = data.frame(Id = Id,
									 Program = Program,
									 term_num = term_num)

	if(!is.null(term)){
		res$term = term
		}



res$dual_credit = dplyr::case_when(

	# the term number for 2015FL is 36
	res$term_num <= 36 &
		( stringr::str_detect(res$Program, "EHSE") |
				stringr::str_detect(res$Program, "EHDC") ) ~ TRUE,

	res$term_num > 36 & (stringr::str_detect(res$Program, "EHSE")) ~ TRUE,

	TRUE ~ FALSE

)





res = res %>%
	group_by(Id, term_num) %>%
	mutate(has_ECHS = any(stringr::str_detect(Program, "ECHS"))) %>%
	ungroup()

res$dual_credit[res$has_ECHS] = FALSE

res$has_ECHS = NULL


res = res %>%
	group_by(Id, term_num) %>%
	mutate(any_dual_credit = any(dual_credit),
				 all_dual_credit = all(dual_credit)) %>%
	ungroup()

res



}
