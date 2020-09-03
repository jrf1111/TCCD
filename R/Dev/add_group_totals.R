
library(tidyverse)
library(rlang)

degs = read_csv("degs_test.csv")
degs$Id = factor(degs$Id)



desired = degs %>%
	group_by(acad_year, Acpg_Title, Stpr_Location) %>%
	count() %>%
	ungroup() %>%
	rbind(.,

				#collapsed across degree
				degs %>%
					group_by(acad_year, Stpr_Location) %>%
					count() %>%
					ungroup() %>%
					mutate(Acpg_Title = "1 Overall"),

				#collapsed across year
				degs %>%
					group_by(Acpg_Title, Stpr_Location) %>%
					count() %>%
					ungroup() %>%
					mutate(acad_year = "1 Overall"),

				#collapsed across campus
				degs %>%
					group_by(acad_year, Acpg_Title) %>%
					count() %>%
					ungroup() %>%
					mutate(Stpr_Location = "1 District"),


				#collapsed across years and campuses
				degs %>%
					group_by(Acpg_Title) %>%
					count() %>%
					ungroup() %>%
					mutate(Stpr_Location = "1 District",
								 acad_year = "1 Overall"),

				#collapsed across years and degrees
				degs %>%
					group_by(Stpr_Location) %>%
					count() %>%
					ungroup() %>%
					mutate(Acpg_Title = "1 Overall",
								 acad_year = "1 Overall"),


				#collapsed across campus and degrees
				degs %>%
					group_by(acad_year) %>%
					count() %>%
					ungroup() %>%
					mutate(Acpg_Title = "1 Overall",
								 Stpr_Location = "1 District"),

				#collapsed across year, campus, and subjects
				data.frame(acad_year = "1 Overall",
									 Acpg_Title = "1 Overall",
									 Stpr_Location = "1 District",
									 n = nrow(degs)
				)

)





degs %>%
	group_by(acad_year, Acpg_Title, Stpr_Location) %>%
	count() %>%
	group_vars()




add_group_totals = function(.data){



}
