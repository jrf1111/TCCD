#' First Generation Student
#'
#' @name first_gen
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
#'   levels be returned? Default is FALSE.
#' @param source Either a character of length one indicating the data source for
#'   the entire dataset ("Discoverer" (the default) or "Orbit"), or a character
#'   vector indicating the data source for each observation.
#'   Note: For 2020FL and later, use data from Orbit.
#'
#'
#' @return if \code{parents = FALSE} (the default), a vector indicating if
#'   students are first generation. If \code{parents = TRUE}, a dataframe
#'   containing mothers' re-coded educational level, fathers' re-coded
#'   educational level, and students' first generation status.
#'
#' @note For 2020FL and later, use data from Orbit.
#'
#' @details The value of the argument `source` will determine which of two auxiliary functions gets called (`first_generation_discoverer` or `first_generation_orbit`).
#'
#'
#' __Definitions__
#' NOHS = No High School
#' SMHS = Some High School
#' HSGD = HS Grad or GED
#' SMCL = Some College
#' CLBD = Completed Bachelor's Degree
#' CLAD = Completed Advanced Degree
#' NRSP = No Response
#' LESS = Less than High School
#' GED = GED
#' HIGH = High School
#' VOC = Vocational/Technical
#' SOME = Some College
#' ASSOC = Associates Degree
#' BACH = Bachelors Degree
#' GRAD = Some Graduate School
#' MAST = Masters or Professional
#' DOC = Doctoral Degree
#' UNKNOWN = Unknown
#'
#' @export
first_generation = function(Mother_Educ_Level, Father_Educ_Level,
														method = c("tcc", "fed"),
														parents = FALSE, source = c("Discoverer", "Orbit")){

	method = match.arg(method)

	if(length(source) == 1){
		source = match.arg(source, choices = c("Discoverer", "Orbit"))
		source = rep(source, times = length(Mother_Educ_Level))
	} else{
		stopifnot(all(source == "Discoverer" | source == "Orbit"))
	}


	res = dplyr::case_when(

		source == "Orbit" ~ first_generation_orbit(Mother_Educ_Level = Mother_Educ_Level,
																							 Father_Educ_Level = Father_Educ_Level,
																							 method = method,
																							 parents = parents,
																							 warn = FALSE),

		source == "Discoverer" ~ first_generation_discoverer(Mother_Educ_Level = Mother_Educ_Level,
																												 Father_Educ_Level = Father_Educ_Level,
																												 method = method,
																												 parents = parents,
																												 warn = FALSE)
	)


}




#' @rdname first_gen
#' @export
first_generation_orbit = function(Mother_Educ_Level, Father_Educ_Level,
																	method = c("tcc", "fed"), parents = FALSE,
																	warn = TRUE){

	method = match.arg(method)

	if(warn){
		warning("This function (first_generation_orbit) should only be used with data from Orbit.")
	}

	if(method == "tcc"){

		mother_level = dplyr::case_when(
			Mother_Educ_Level %in% c("M-SMCL", "M-CLBD", "M-CLAD",
															 "VOC", "SOME", "ASSOC", "BACH",
															 "GRAD", "MAST", "DOC") ~ "College",

			Mother_Educ_Level %in% c("M-NOHS", "M-SMHS", "M-HSGD",
															 "LESS", "GED", "HIGH") ~ "No College",

			Mother_Educ_Level %in% c("", " ", NA,
															 "M-NRSP", "UNKNOWN", "0")  ~ "Unknown",
			TRUE ~ "Unknown"
		)


		father_level = dplyr::case_when(
			Father_Educ_Level %in% c("F-SMCL", "F-CLBD", "F-CLAD",
															 "VOC", "SOME", "ASSOC", "BACH",
															 "GRAD", "MAST", "DOC") ~ "College",

			Father_Educ_Level %in% c("F-NOHS", "F-SMHS", "F-HSGD",
															 "LESS", "GED", "HIGH") ~ "No College",

			Father_Educ_Level %in% c("", " ", NA,
															 "F-NRSP", "UNKNOWN", "0")  ~ "Unknown",
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
			Mother_Educ_Level %in% c("M-CLBD", "M-CLAD",
															 "BACH", "GRAD", "MAST", "DOC") ~ "College",

			Mother_Educ_Level %in% c("M-NOHS", "M-SMHS", "M-HSGD",
															 "M-SMCL",
															 "LESS", "GED", "HIGH",
															 "VOC", "SOME", "ASSOC") ~ "No College",

			Mother_Educ_Level %in% c("", " ", NA,
															 "M-NRSP", "UNKNOWN", "0")  ~ "Unknown",
			TRUE ~ "Unknown"
		)


		father_level = dplyr::case_when(
			Father_Educ_Level %in% c("F-CLBD", "F-CLAD",
															 "BACH", "GRAD", "MAST", "DOC") ~ "College",

			Father_Educ_Level %in% c("F-NOHS", "F-SMHS", "F-HSGD",
															 "F-SMCL",
															 "LESS", "GED", "HIGH",
															 "VOC", "SOME", "ASSOC") ~ "No College",

			Father_Educ_Level %in% c("", " ", NA,
															 "F-NRSP", "UNKNOWN", "0")  ~ "Unknown",
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



#' @rdname first_gen
#' @export
first_generation_discoverer = function(Mother_Educ_Level, Father_Educ_Level,
																			 method = c("tcc", "fed"), parents = FALSE,
																			 warn = TRUE){

	method = match.arg(method)

	if(warn){
		wrn = paste("This function should only be used with data from Discoverer for terms before 2020FL.",
								"For 2020FL and later, use data from Orbit.",
								sep = "\n"
		)
		warning(wrn)
	}

	if(method == "tcc"){

		mother_level = dplyr::case_when(
			Mother_Educ_Level == "M-CLAD"  ~ "College",
			Mother_Educ_Level == "M-CLBD"  ~ "College",
			Mother_Educ_Level == "M-SMCL"  ~ "College",

			Mother_Educ_Level == "M-HSGD"  ~ "No College",
			Mother_Educ_Level == "M-NOHS"  ~ "No College",
			Mother_Educ_Level == "M-SMHS"  ~ "No College",

			Mother_Educ_Level == "" | Mother_Educ_Level == " " | is.na(Mother_Educ_Level) ~ "Unknown",
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

			Father_Educ_Level == "" | Father_Educ_Level == " " | is.na(Father_Educ_Level) ~ "Unknown",
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
