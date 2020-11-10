
library(tidyverse)
library(rlang)





with_subtotals = function(){


}



summarize_with_totals = function(.data, ..., .add = FALSE, .drop = dplyr::group_by_drop_default(.data)){

	groups <- dplyr:::group_by_prepare(.data, ..., .add = .add)

	#probably needs to be based on the following path
	#dplyr:::summarise.grouped_df line 37 : "out <- grouped_df(out, group_vars, group_by_drop_default(.data))"
	#   \/
	#  dplyr:::grouped_df line 13 : "groups <- compute_groups(data, vars, drop = drop)"
	#   \/
	# returns a tibble with one column for each group var and a
	# list column called `.rows` that indicates which rows comprise each group



}
