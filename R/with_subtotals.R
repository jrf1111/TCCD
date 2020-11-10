
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




with_subtotals = function(df){

	#get the group vars
	groups = dplyr::group_vars(df)
	original_df = dplyr::ungroup(df)
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

	old_classes = class(df)
	df = data.table::rbindlist(list(df, temp))
	class(df) = old_classes


	#make a 'grand total' group
	temp = original_df %>% dplyr::mutate_at(dplyr::vars(!!!groups), ~ "total")
	old_classes = class(df)
	df = data.table::rbindlist(list(df, temp))
	class(df) = old_classes
	rm(original_df, temp)



	df = dplyr::group_by(df, !!!rlang::syms(groups))
	df


}


test = mdata %>%
	group_by(class, year) %>%
	with_subtotals() %>%
	summarise(pass = mean(pass),
						n = n(),
						n_dist = n_distinct(id)
	) %>%
	ungroup()






test2 = data.table::rbindlist(
	list(
		mdata %>%
			group_by(class, year) %>%
			summarise(pass = mean(pass),
								n = n(),
								n_dist = n_distinct(id)
			) %>%
			ungroup(),

		mdata %>%
			group_by(class) %>%
			summarise(pass = mean(pass),
								n = n(),
								n_dist = n_distinct(id),
								year = "subtotal"
			) %>%
			ungroup(),

		mdata %>%
			group_by(year) %>%
			summarise(pass = mean(pass),
								n = n(),
								n_dist = n_distinct(id),
								class = "subtotal"
			) %>%
			ungroup(),


		mdata %>%
			summarise(pass = mean(pass),
								n = n(),
								n_dist = n_distinct(id),
								class = "total",
								year = "total"
			) %>%
			ungroup()
	),
	use.names = TRUE
)



test = test %>% arrange_all()
test2 = test2 %>% arrange_all()

all.equal(test, test2, check.attributes = FALSE)
