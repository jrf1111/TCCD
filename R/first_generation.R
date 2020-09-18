#' First Generation Student
#'
#' @param Mother_Educ_Level The highest level of educational attainment of the
#'   student's mother.
#' @param Father_Educ_Level The highest level of educational attainment of the
#'   student's father.
#' @param method What definition of "first generation student" to use. Use
#'   \code{method = "tcc"} to use the internal definition (student is first
#'   generation if mom \emph{and} dad have no college); this definition is
#'   mainly used internally for reports such as the extended campus profiles.
#'   Use \code{method = "fed"} to use the federal definition (student is first
#'   generation if mom \emph{and} dad have no bachelor's degree); this
#'   definition is used for grant requests.
#' @param parents Logical. Should the re-coded values for parents' educational
#'                levels be returned? Default is FALSE.
#'
#'
#' @return if \code{parents = FALSE} (the default), a vector indicating if
#'   students are first generation. If \code{parents = TRUE}, a dataframe
#'   containing mothers' re-coded educational level, fathers' re-coded
#'   educational level, and students' first generation status.
#' @export
#'
#' @details Defintions:
#' NOHS = No High School
#' SMHS = Some High School
#' HSGD = HS Grad or GED
#' SMCL = Some College
#' CLBD = Completed Bachelor's Degree
#' CLAD = Completed Advanced Degree
#' NRSP = No Response
#'
#'
#' @examples
first_generation = function(Mother_Educ_Level, Father_Educ_Level, method = "tcc", parents = FALSE){

	if(method == "tcc"){

		mother_level = dplyr::case_when(
			Mother_Educ_Level == "M-CLAD"  ~ "College",
			Mother_Educ_Level == "M-CLBD"  ~ "College",
			Mother_Educ_Level == "M-SMCL"  ~ "College",

			Mother_Educ_Level == "M-HSGD"  ~ "No College",
			Mother_Educ_Level == "M-NOHS"  ~ "No College",
			Mother_Educ_Level == "M-SMHS"  ~ "No College",

			Mother_Educ_Level == "" | is.na(Mother_Educ_Level) ~ "Unknown",
			Mother_Educ_Level == "M-NRSP"  ~ "Unknown",
			TRUE ~ "Unknown"
		)


		father_level = dplyr::case_when(
			Father_Educ_Level == "F-CLAD"  ~ "College",
			Father_Educ_Level == "F-CLBD"  ~ "College",
			Father_Educ_Level == "F-SMCL"  ~ "College",

			Father_Educ_Level == "F-HSGD"  ~ "No College",
			Father_Educ_Level == "F-NOHS"  ~ "No College",
			Father_Educ_Level == "F-SMHS"  ~ "No College",

			Father_Educ_Level == "" | is.na(Father_Educ_Level) ~ "Unknown",
			Father_Educ_Level == "F-NRSP"  ~ "Unknown",
			TRUE ~ "Unknown"
			)


		first_gen = dplyr::case_when(
			mother_level == "College" | father_level == "College" ~ "Not First Gen",
			mother_level == "No College" & father_level == "No College" ~ "First Gen",
			mother_level == "Unknown" | father_level == "Unknown" ~ "Unknown",
			TRUE ~ "Unknown"
		)


	}

	if(method == "fed"){

		mother_level = dplyr::case_when(
			Mother_Educ_Level == "M-CLAD"  ~ "College",
			Mother_Educ_Level == "M-CLBD"  ~ "College",

			Mother_Educ_Level == "M-SMCL"  ~ "No College",
			Mother_Educ_Level == "M-HSGD"  ~ "No College",
			Mother_Educ_Level == "M-NOHS"  ~ "No College",
			Mother_Educ_Level == "M-SMHS"  ~ "No College",

			Mother_Educ_Level == "" | is.na(Mother_Educ_Level) ~ "Unknown",
			Mother_Educ_Level == "M-NRSP"  ~ "Unknown",
			TRUE ~ "Unknown"
		)


		father_level = dplyr::case_when(
			Father_Educ_Level == "F-CLAD"  ~ "College",
			Father_Educ_Level == "F-CLBD"  ~ "College",

			Father_Educ_Level == "F-SMCL"  ~ "No College",
			Father_Educ_Level == "F-HSGD"  ~ "No College",
			Father_Educ_Level == "F-NOHS"  ~ "No College",
			Father_Educ_Level == "F-SMHS"  ~ "No College",

			Father_Educ_Level == "" | is.na(Father_Educ_Level) ~ "Unknown",
			Father_Educ_Level == "F-NRSP"  ~ "Unknown",
			TRUE ~ "Unknown"
		)


		first_gen = dplyr::case_when(
			mother_level == "College" | father_level == "College" ~ "Not First Gen",
			mother_level == "No College" & father_level == "No College" ~ "First Gen",
			mother_level == "Unknown" | father_level == "Unknown" ~ "Unknown",
			TRUE ~ "Unknown"
		)


	}

	if(parents==TRUE){
		return(data.frame(mother_level, father_level, first_gen))
	} else(
		return(first_gen)
	)

}
