


#' @title term_num_to_acad_year
#'
#' @param Term_num the numeric code for the term, such as calculated by `Term_num()`
#'
#' @return A character vector of the relevant academic year (e.g., "2018-2019").
#'
#' @export
term_num_to_acad_year = function(Term_num){

	res = dplyr::case_when(

		Term_num %in%	c(1:2)  ~ '2003-2004',
		Term_num %in% c(3:5)  ~ '2004-2005',
		Term_num %in% c(6:8)  ~ '2005-2006',
		Term_num %in% c(9:11)  ~ '2006-2007',
		Term_num %in% c(12:14)  ~ '2007-2008',
		Term_num %in% c(15:17)  ~ '2008-2009',
		Term_num %in% c(18:20)  ~ '2009-2010',
		Term_num %in% c(21:23)  ~ '2010-2011',
		Term_num %in% c(24:26)  ~ '2011-2012',
		Term_num %in% c(27:29)  ~ '2012-2013',
		Term_num %in% c(30:32)  ~ '2013-2014',
		Term_num %in% c(33:35)  ~ '2014-2015',
		Term_num %in% c(36:38)  ~ '2015-2016',
		Term_num %in% c(39:41)  ~ '2016-2017',
		Term_num %in% c(42:44)  ~ '2017-2018',
		Term_num %in% c(45:47)  ~ '2018-2019',
		Term_num %in% c(48:50)  ~ '2019-2020',
		Term_num %in% c(51:53)  ~ '2020-2021',
		Term_num %in% c(54:56)  ~ '2021-2022',
		TRUE ~ as.character(Term_num))

	res

}








#' @title term_ID_to_acad_year
#'
#' @param Term_Id A character vector that identifies the term (e.g., "2019FL" or "2019Q1").
#'
#' @description Based on `AcademicYear.sps`
#'
#' @return A character vector of the academic year that the terms belong to (e.g., ""2019-2020).
#'
#' @examples
#' term_ID_to_acad_year("2019SU")   # "2018-2019"
#'
#' @export
term_ID_to_acad_year = function(Term_Id){


	term = data.frame(Term_Id = Term_Id)

	ref_tab = data.frame(  year = rep(2002:2050, each=7),
												 Term_Id = paste0(rep(2002:2050, each=7),
												 								 c("FL", "SP", "SU", "Q1", "Q2", "Q3", "Q4")))

	ref_tab$term = gsub("^(\\d*)(..)$", "\\2", ref_tab$Term_Id)



	#based on AcademicYear.sps:
	# DO IF (Term='2004Q1' OR Term='2004Q2' OR Term='2005Q3' OR Term='2005Q4').
	# COMPUTE AcademicYear='2004-2005'.
	# ...
	# DO IF (Term='2004FL' OR Term='2005SP' OR Term='2005SU' ).
	# COMPUTE AcademicYear='2004-2005'.

	ref_tab$ay_start = dplyr::case_when(
		ref_tab$term == "FL" ~ ref_tab$year,
		ref_tab$term == "SP" ~ as.integer(ref_tab$year-1),
		ref_tab$term == "SU" ~ as.integer(ref_tab$year-1),
		ref_tab$term == "Q1" ~ ref_tab$year,
		ref_tab$term == "Q2" ~ ref_tab$year,
		ref_tab$term == "Q3" ~ as.integer(ref_tab$year-1),
		ref_tab$term == "Q4" ~ as.integer(ref_tab$year-1)
	)


	ref_tab$ay_end = ref_tab$ay_start+1

	ref_tab$acad_year = paste0(ref_tab$ay_start, "-", ref_tab$ay_end)

	res = plyr::join(term, ref_tab[, c("Term_Id", "acad_year")], by="Term_Id")

	res$acad_year



}

