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
	

	# Term    						Program code(s)	    Dual credit?
	# 2015FL and before		EHDC & EHSE         Yes
	# 2015FL and before		EHSE	              Yes
	# 2015FL and before		EHDC	              Yes
	# 2015FL and before		*ECHS* & EHDC	      No
	# 2015FL and before		*ECHS* & EHSE	      No
	# 2015FL and before		*ECHS*	            No
	# 2015FL and before		None of the above	  No
	
	# Term	      				Program code(s)	      Dual credit?
	# After 2015FL				EHSE	                Yes
	# After 2015FL				EHDC & EHSE         	Yes
	# After 2015FL				*ECHS* & EHSE	        No
	# After 2015FL				*ECHS*	              No
	# After 2015FL				*ECHS* & EHDC	        No
	# After 2015FL				EHDC      	          No
	# After 2015FL				None of the above	    No
	
	
	




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




res = res %>%
	group_by(Id, term_num) %>%
	mutate(any_dual_credit = max(dual_credit),
				 all_dual_credit = min(dual_credit)) %>%
	ungroup()

res



}