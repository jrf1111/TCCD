


#' @title term_num_to_acad_year
#'
#' @param Term_num the numeric code for the term, such as calculated by `Term_num()`
#'
#' @return A character vector of the relevant academic year (e.g., "2018-2019").
#' @import dplyr
#'
#'
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
		TRUE ~ as.character(Term_num))


}








#' @title term_ID_to_acad_year
#'
#' @param Term_Id A character vector that identifies the term (e.g., "2019FL" or "2019Q1").
#'
#' @description Based on `AcademicYear.sps`
#'
#' @return A character vector of the academic year that the terms belong to (e.g., ""2019-2020).
#' @import plyr
#'
#' @examples
#' term_ID_to_acad_year("2019SU")   # "2018-2019"
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






#
# USE ALL.
# STRING Degree_Acad_year (A14).
# RECODE DegreeTerm_num (1 thru 2='AY2003-04') (3 thru 5='AY2004-05')(6 thru 8='AY2005-06') (9 thru 11='AY2006-07') (12 thru 14='AY2007-08') (15 thru 17='AY2008-09') (18 thru 20='AY2009-10')
# (21 thru 23='AY 2010-11') (24 thru 26='AY 2011-12')  (27 thru 29='AY2012-13') (30 thru 32='AY2013-14')(33 thru 35='AY2014-15') (36 thru 38 ='AY2015-16') (39 thru 41='AY2016-17')
# (42 thru 44='AY2017-18') (45 thru 47='AY2018-19') (49 thru 50='AY2019-20') INTO Degree_Acad_year.
# VARIABLE LABELS  Degree_Acad_year 'Degree Academic Year'.
# EXECUTE.
#
#
#
# * Custom Tables.
# CTABLES
# /VLABELS VARIABLES=Passing_course Acad_year StcTerm DISPLAY=LABEL
# /TABLE Passing_course [C] BY Acad_year [C] > StcTerm [C][COUNT F40.0]
# /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
# /CATEGORIES VARIABLES=Acad_year ORDER=A KEY=VALUE EMPTY=EXCLUDE
# /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
# /TITLES
# TITLE='RDNG-0361 Check AY 2010-11 and AY 2011-12'.
#
#
#
# * Custom Tables.
# CTABLES
# /VLABELS VARIABLES=StcCourseName Passing_course Acad_year Term_num DISPLAY=LABEL
# /TABLE StcCourseName [C] > Passing_course [C][COUNT F40.0] BY Acad_year [C] > Term_num [C]
# /CATEGORIES VARIABLES=StcCourseName Acad_year ORDER=A KEY=VALUE EMPTY=EXCLUDE
# /CATEGORIES VARIABLES=Passing_course ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
# /CATEGORIES VARIABLES=Term_num ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
# /TITLES
# TITLE='ENGL ATD FTIC check Bonnie 12-10-2012'.
#
#
#
# USE ALL.
# COMPUTE filter_$=((Term_num >= 21 & Term_num < 27) & FTIC_NOAUDIT_NODUAL_DEGREESEEK = 'X').
# VARIABLE LABELS filter_$ "(Term_num >= 21 & Term_num < 27) & FTIC_NOAUDIT_NODUAL_DEGREESEEK = "+
# 	"'X' (FILTER)".
# VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
# FORMATS filter_$ (f1.0).
# FILTER BY filter_$.
# EXECUTE.
#
#
#
# COMPUTE Term_ToNUM=STRING(Term_num,F2.0).
# EXECUTE.
#
# RECODE STSC_WIN_1SEM (0 thru 1=1) (ELSE=0) INTO Pass_STSC_WIN_1SEM.
# VARIABLE LABELS  Pass_STSC_WIN_1SEM 'pass STSC within 1 semester'.
# EXECUTE.
#
# *STSC and courses syntax.
#
# COMPUTE STSC_win_1sem=(Term_num - Term_num_STSC)>= 0 &(Term_num - Term_num_STSC) <= 1 .
# VARIABLE LABELS  STSC_win_1sem 'STSC_ within 1 sem'.
# EXECUTE.
#
# RECODE STSC_win_1sem (SYSMIS=0).
# EXECUTE.
#
# value labels STSC_win_1sem
# 0 'No'
# 1 'Yes'.
#
# USE ALL.
# COMPUTE filter_$=(Passing_course = 'Yes'  & MatchSequence = 0 & ATD_FTIC = 1).
# VARIABLE LABELS filter_$ "Passing_course = 'Yes'  & MatchSequence = 0 & ATD_FTIC = 1 (FILTER)".
# VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
# FORMATS filter_$ (f1.0).
# FILTER BY filter_$.
# EXECUTE.
#
# FREQUENCIES VARIABLES=Passing_course ATD_FTIC MatchSequence
# /ORDER=ANALYSIS.
#
#
#
# * Custom Tables.
# CTABLES
# /VLABELS VARIABLES=Campus StcTerm STSC_win_1sem DISPLAY=LABEL
# /TABLE Campus [C] > StcTerm [C][COUNT F40.0, ROWPCT.COUNT PCT40.1] BY STSC_win_1sem [C]
# /CATEGORIES VARIABLES=Campus ORDER=A KEY=VALUE EMPTY=EXCLUDE
# /CATEGORIES VARIABLES=StcTerm ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=BEFORE
# /CATEGORIES VARIABLES=STSC_win_1sem ORDER=A KEY=VALUE EMPTY=INCLUDE.
