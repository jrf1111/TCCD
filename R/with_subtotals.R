#' Add subtotals to grouped `dplyr` operations
#'
#' @param df A grouped data frame or data frame extension (e.g. a tibble)
#'
#' @return A grouped object of the same type as `df` but with additional rows that contain group subtotals and totals.
#'
#' @note In order to create the extra subtotal and total groups, this function has the unfortunate side effect of increasing the number of rows of `df`. This may result in performance issues and/or exhaust available memory. It may, therefore, be advisable to pass a reduced version of `df` containing only the variables necessary to perform the desired operation(s), for example, by calling `select()` before `group_by(...) %>% with_subtotals()`.
#'
#'
#'
#' @examples
#'
#' library(tidyverse)
#' library(data.table)
#'
#' #create sample data
#' n=200
#' set.seed(1)
#' mdata = tibble(
#' 	id = sample(1:10, size=n, replace = T),
#' 	year = ceiling(id/4),
#' 	class = factor(sample(letters[1:5], size=n, replace = T)),
#' 	pass = rbinom(n, size = 1, prob = 0.5)
#' )
#'
#'
#' ###################################################################
#' #using with_subtotals() with multiple grouping variables
#' #  Since there is more than one grouping variable,
#' #  each grouping variable will have a 'subtotal' group added to it
#' #  and there will be an additional 'total' group
#' #  that is the grand total created by collapsing
#' #  across all of the grouping variables.
#' ###################################################################
#'
#'
#' test = mdata %>%
#' 	group_by(class, year) %>%
#' 	with_subtotals() %>%
#' 	summarise(
#' 	pass = mean(pass),
#' 	n = n(),
#' 	n_dist = n_distinct(id)
#' 	) %>%
#' 	ungroup()
#'
#'
#' #the old, long, and error prone way
#' test2 = data.table::rbindlist(
#' 	list(
#' 		mdata %>%
#' 			group_by(class, year) %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id)
#' 			) %>%
#' 			ungroup(),
#'
#' 		mdata %>%
#' 			group_by(class) %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id),
#' 			year = "subtotal"
#' 			) %>%
#' 			ungroup(),
#'
#' 		mdata %>%
#' 			group_by(year) %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id),
#' 			class = "subtotal"
#' 			) %>%
#' 			ungroup(),
#'
#'
#' 		mdata %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id),
#' 			class = "total",
#' 			year = "total"
#' 			) %>%
#' 			ungroup()
#' 	),
#' 	use.names = TRUE
#' )
#'
#'
#'
#' test = test %>% arrange_all()
#' test2 = test2 %>% arrange_all()
#'
#' all.equal(test, test2, check.attributes = FALSE)  #TRUE
#'
#'
#'
#'
#'
#' ########################################################
#' #using with_subtotals() with one grouping variable
#' #  Since there is only one grouping variable,
#' #  the grouping variable will have a 'subtotal' group added to it
#' #  but there will *NOT* be an additional 'total' group
#' #  because that would be redundant.
#' ########################################################
#'
#' test = mdata %>%
#' 	group_by(class) %>%
#' 	with_subtotals() %>%
#' 	summarise(
#' 	pass = mean(pass),
#' 	n = n(),
#' 	n_dist = n_distinct(id)
#' 	) %>%
#' 	ungroup()
#'
#'
#' #the old, long, and error prone way
#' test2 = data.table::rbindlist(
#' 	list(
#' 		mdata %>%
#' 			group_by(class) %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id)
#' 			) %>%
#' 			ungroup(),
#'
#' 		mdata %>%
#' 			summarise(
#' 			pass = mean(pass),
#' 			n = n(),
#' 			n_dist = n_distinct(id),
#' 			class = "subtotal"
#' 			) %>%
#' 			ungroup()
#' 	),
#' 	use.names = TRUE
#' )
#'
#'
#'
#' test = test %>% arrange_all()
#' test2 = test2 %>% arrange_all()
#'
#' all.equal(test, test2, check.attributes = FALSE)  #TRUE
#'
#'
#'
#' @export
with_subtotals = function(df){

	#get the grouping vars
	groups = dplyr::group_vars(df)

	stopifnot(length(groups)>0)

	df = dplyr::ungroup(df)

	if(length(groups) > 1){

		#a backup for getting overall totals later
		original_df = dplyr::ungroup(df)

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

			if(i == 1){
				temp = df %>% dplyr::mutate({{ group }} := "subtotal")
			} else{
				temp2 = df %>% dplyr::mutate({{ group }} := "subtotal")
				old_classes = class(temp)
				temp = data.table::rbindlist(list(temp, temp2))
				class(temp) = old_classes
				rm(temp2)
			}

		}

		#add the subtotals to the data
		old_classes = class(df)
		df = data.table::rbindlist(list(df, temp))
		class(df) = old_classes



		#make a 'total' group
		temp = original_df %>% dplyr::mutate_at(dplyr::vars(!!!groups), ~ "total")

		#add the 'total' group to the data
		old_classes = class(df)
		df = data.table::rbindlist(list(df, temp))
		class(df) = old_classes
		rm(original_df, temp)
	}


	if(length(groups) == 1){

		#make a new 'subtotal' group for the one group var
		group = groups[1]
		var = rlang::sym(group)

		if(is.factor(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate(
				{{ group }} := forcats::fct_expand( !!var , "subtotal")
			)
		} else if(!is.character(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate( {{ group }} := as.character( !!var ) )
		}

		temp = df %>% dplyr::mutate({{ group }} := "subtotal")

		#add the subtotal to the data
		old_classes = class(df)
		df = data.table::rbindlist(list(df, temp))
		class(df) = old_classes
		rm(temp)

	}

	#restore grouping variables
	df = dplyr::group_by(df, !!!rlang::syms(groups))
	df

}









