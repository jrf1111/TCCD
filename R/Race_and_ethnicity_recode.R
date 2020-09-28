

#Recode race and ethnicity
#
#' @title ethnic_recode
#'
#' @param Races The 'Races' variable.
#' @param Ethnics The 'Ethnics' variable.
#'
#' @description Calculates the new race/ethnicity definition (07-19-2017).  Based on `New Ethnicity Recodes for ST Students Enrollment Files 10-25-2018.sps`. Updated 2020-09-15 to account for Ethnics = "No Ethnicity Listed".
#'
#' @return a character vector.
#' @export
ethnic_recode = function(Races, Ethnics){

	Races[is.na(Races)] = ""
	Ethnics[is.na(Ethnics)] = ""

	dplyr::case_when(
		Races == "International" ~ 'International',
		Ethnics=='Hispanic/Latino' ~ 'Hispanic Latino',

		Ethnics!='Hispanic/Latino' & Races=='White' ~ 'White',

		Ethnics!='Hispanic/Latino' & Races=='Black or African American' ~ 'Black / African American',

		Ethnics!='Hispanic/Latino' & Races=='Asian' ~'Asian',

		Ethnics!='Hispanic/Latino'  & Races=='American/Alaska Native' ~ 'American Indian / Alaska Native',

		Ethnics!='Hispanic/Latino' & Races=='Hawaiian/Pacific Islander' ~'Native Hawaiian / Pacific Islander',

		Ethnics!='Hispanic/Latino' & Races=='Race Unknown' ~ 'Unknown / Not Reported',

		Ethnics!='Hispanic/Latino' & Races=='Multi' ~ 'Multiracial',

		TRUE ~ 'Unknown / Not Reported'

	)


}






#' @title new_ethnic_group
#'
#' @param newEthnicity the result from running `ethnic_recode()`
#'
#'#' @description Calculates the new race/ethnicity definition (07-19-2017).  Based on `New Ethnicity Recodes for ST Students Enrollment Files 10-25-2018.sps`.
#'
#' @return a character vector.
#'
#' @examples
#' new_ethnic_group("White") #"1. White"
#' new_ethnic_group("Black / African American") #"2. Black / African American"
#' new_ethnic_group("Hispanic Latino") #"3. Hispanic Latino"
#' new_ethnic_group("Asian") #"4. Other"   everything else
#' @export
new_ethnic_group = function(newEthnicity){

	dplyr::case_when(
		newEthnicity == "White" ~ "1. White",
		newEthnicity == "Black / African American" ~ "2. Black / African American",
		newEthnicity == "Hispanic Latino" ~ "3. Hispanic Latino",
		TRUE ~ "4. Other"
	)


}






#' newEthnicity3
#'
#' @param Races The 'Races' variable.
#' @param Ethnics The 'Ethnics' variable.
#'
#' @description Calculates the new race/ethnicity definition (07-19-2017).  Based on `New Ethnicity Recodes for ST Students Enrollment Files 10-25-2018.sps`.
#' @export
newEthnicity3 = function(Races, Ethnics){

	dplyr::case_when(
		Races=='International' ~ 'International',
		Ethnics=='Hispanic/Latino' ~ 'Hispanic Latino',
		Races=='White' ~ 'White',
		Races=='Black or African American' ~ 'Black / African American',
		Races=='Asian' ~ 'Asian',
		Races=='American/Alaska Native' ~ 'American Indian / Alaska Native',
		Races=='Hawaiian/Pacific Islander'~ 'Native Hawaiian / Pacific Islander',
		Races=='Race Unknown' ~ 'Unknown / Not Reported',
		Races=='Multi' ~ 'Multiracial',
		Races== 'ELF' ~ 'ELF',  #not sure if this is a joke/test or not...
		TRUE ~ 'Unknown / Not Reported'
	)


}
