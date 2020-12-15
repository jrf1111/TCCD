#' Add subtotals to grouped `dplyr` operations
#'
#' @param df A grouped data frame or data frame extension (e.g. a tibble)
#'
#' @return A grouped object of the same type as `df` but with additional rows that contain group (sub)totals and grand totals.
#'
#' @note In order to create the extra subtotal and total groups, this function has two unfortunate side effects.  The first side effect is that it increases the number of rows of `df`. This may result in performance issues and/or exhaust available memory. It may, therefore, be advisable to pass a reduced version of `df` containing only the variables necessary to perform the desired operation(s), for example, by calling `select()` before `group_by(...) %>% with_subtotals()`.  The second side effect is that in order to create the total groups, it must *make* the total group for each grouping variable.  Currently, this is achieved by (1) converting numeric variables to characters or adding a new level to factors then (2) adding the new `total_` group (a value that hopefully does not already exist in the grouping variable).  Future versions of this function will hopefully address these limitations.
#'
#'
#'
#'
#'
#' @examples
#'
#' library(tidyverse)
#' library(data.table)
#'
#' test = mtcars %>%
#' 	group_by(cyl, am) %>%
#' 	with_subtotals() %>%
#' 	summarise(
#' 	n = n(),
#' 	mean_mpg = mean(mpg)
#' 	) %>%
#' 	ungroup()
#'
#'
#' #the old, long, and error prone way
#' test2 = data.table::rbindlist(
#' 	list(
#' 		mtcars %>%
#' 			group_by(cyl, am) %>%
#' 			summarise(
#' 			n = n(),
#' 			mean_mpg = mean(mpg)
#' 			) %>%
#' 			ungroup(),
#'
#' 		mtcars %>%
#' 			group_by(cyl) %>%
#' 			summarise(
#' 			n = n(),
#' 			mean_mpg = mean(mpg),
#' 			am = "total_"
#' 			) %>%
#' 			ungroup(),
#'
#' 		mtcars %>%
#' 			group_by(am) %>%
#' 			summarise(
#' 			n = n(),
#' 			mean_mpg = mean(mpg),
#' 			cyl = "total_"
#' 			) %>%
#' 			ungroup(),
#'
#'
#' 		mtcars %>%
#' 			summarise(
#' 			n = n(),
#' 			mean_mpg = mean(mpg),
#' 			am = "total_",
#' 			cyl = "total_"
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


		#for each group var, make a new 'total' group
		total = function(df, group){

			var = rlang::sym(group)

			if(is.factor(dplyr::pull(df, {{ group }} ))){
				df = df %>% dplyr::mutate(
					{{ group }} := forcats::fct_expand( !!var , "total_")
				)
			} else if(!is.character(dplyr::pull(df, {{ group }} ))){
				df = df %>% dplyr::mutate( {{ group }} := as.character( !!var ) )
			}

			df %>% dplyr::mutate({{ group }} := "total_")

		}

		totals = data.table::rbindlist(
			lapply(groups, function(x){total(df, x)}),
			use.names = TRUE, fill = TRUE )

		#make a 'grand total' group
		grand_total = original_df %>% dplyr::mutate_at(dplyr::vars(!!!groups), ~ "total_")

		#add the total and grand total groups to the data
		old_classes = class(df)
		df = data.table::rbindlist(list(df, totals, grand_total))
		class(df) = old_classes
		rm(original_df, totals, grand_total)

	}


	if(length(groups) == 1){

		#make a new 'total' group for the one group var
		group = groups[1]
		var = rlang::sym(group)

		if(is.factor(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate(
				{{ group }} := forcats::fct_expand( !!var , "total_")
			)
		} else if(!is.character(dplyr::pull(df, {{ group }} ))){
			df = df %>% dplyr::mutate( {{ group }} := as.character( !!var ) )
		}

		temp = df %>% dplyr::mutate({{ group }} := "total_")

		#add the total to the data
		old_classes = class(df)
		df = data.table::rbindlist(list(df, temp))
		class(df) = old_classes
		rm(temp)

	}

	#restore grouping variables
	df = dplyr::group_by(df, !!!rlang::syms(groups))
	df

}

