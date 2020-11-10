
library(tidyverse)
library(rlang)

n=200
set.seed(1)
mdata = tibble(
	id = sample(1:10, size=n, replace = T),
	year = ceiling(id/4),
	class = factor(sample(letters[1:5], size=n, replace = T)),
	pass = rbinom(n, size = 1, prob = 0.5)
)


mdata %>%
	group_by(class, year) %>%
	summarise(pass = mean(pass))


df = mdata %>% group_by(class, year)


with_subtotals = function(df){

	#get the group vars
	groups = dplyr::group_vars(df)
	df = dplyr::ungroup(df)

	#for each group var, make a new 'subtotal' group
	for(i in 1:length(groups)){
		group = groups[i]
		var = rlang::sym(group)

		if(is.factor(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate(
				 {{ group }} := forcats::fct_expand( !!var , "subtotal", "total")
				)
		} else if(!is.character(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate( {{ group }} := as.character( !!var ) )
		}

		temp = df %>% dplyr::mutate({{ group }} := "subtotal")
		df = dplyr::bind_rows(df, temp)
		rm(temp)
	}


	#make a 'grand total' group
	temp = df %>% dplyr::mutate_at(dplyr::vars(!!!groups), ~ "total")
	df = dplyr::bind_rows(df, temp)
	rm(temp)

	df = dplyr::group_by(df, !!!rlang::syms(groups))
	df


}


temp = mdata %>%
	group_by(class, year) %>%
	with_subtotals()


mdata %>%
	group_by(class, year) %>%
	with_subtotals() %>%
	summarise(pass = mean(pass))









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
