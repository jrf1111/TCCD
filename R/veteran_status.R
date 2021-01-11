#' Veteran and Military-Connected Status
#'
#' @param Military_Statuses Military status code, usually from Student Summary General
#' @param Smv_Vetben_Elig_Code Veteran benefits eligibility code, usually from Student Summary General
#' @param active Logical.  Should active-duty be its own category? Default is `FALSE`.
#'
#' @return Returns a character vector indicating if student is a veteran, dependent, or not-military connected
#' @export
#'
vet_status = function(Military_Statuses, Smv_Vetben_Elig_Code, active = FALSE){

	if(active){
		Vet_Status = dplyr::case_when(
			Military_Statuses == 'A' ~ 'Active',
			Military_Statuses == 'G' ~ 'Active',
			Military_Statuses == 'R' ~ 'Active',
			Smv_Vetben_Elig_Code == 'A' ~ 'Active',
			Smv_Vetben_Elig_Code == 'V' ~ 'Veteran',
			Military_Statuses == 'D' ~ 'Dependent',
			Military_Statuses == 'X' ~ 'Dependent',
			Military_Statuses == 'I' ~ 'Dependent',
			Smv_Vetben_Elig_Code == 'S' ~ 'Dependent',
			Smv_Vetben_Elig_Code == 'D' ~ 'Dependent',
			TRUE ~ 'Not a Veteran'
		)
	} else{
		Vet_Status = dplyr::case_when(
			Military_Statuses == 'A' ~ 'Veteran',
			Military_Statuses == 'G' ~ 'Veteran',
			Military_Statuses == 'R' ~ 'Veteran',
			Smv_Vetben_Elig_Code == 'V' ~ 'Veteran',
			Smv_Vetben_Elig_Code == 'A' ~ 'Veteran',
			Military_Statuses == 'D' ~ 'Dependent',
			Military_Statuses == 'X' ~ 'Dependent',
			Military_Statuses == 'I' ~ 'Dependent',
			Smv_Vetben_Elig_Code == 'S' ~ 'Dependent',
			Smv_Vetben_Elig_Code == 'D' ~ 'Dependent',
			TRUE ~ 'Not a Veteran'
		)
	}

	Vet_Status


}

