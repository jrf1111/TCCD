library(tidyverse)

syn = readLines("SPSS syntax files/TimeToGrad.sps")
syn = str_remove(syn, fixed("* Encoding: UTF-8."))

syn = syn[ syn != ""]


syn = str_replace_all(syn, "\\( ", "\\(")
syn = str_replace_all(syn, " \\)", "\\)")
syn = str_replace_all(syn, "\\s?=\\s?", "=")
syn = str_replace_all(syn, "\\s?,\\s?", ",")
syn = str_replace_all(syn, "  ", " ")
syn = str_replace_all(syn, "^Compute ", "COMPUTE ")
syn = str_replace_all(syn, "^if\\(", "IF\\(")
syn = str_replace_all(syn, "^If\\(", "IF\\(")



start = grepl("^STRING", syn, ignore.case = T) |
	grepl("^NUMERIC", syn, ignore.case = T) |
	grepl("^VALUE LABELS", syn, ignore.case = T) |
	grepl("^COMPUTE", syn, ignore.case = T)

end = grepl("EXECUTE\\.", syn, ignore.case = T)


df = data.frame(syn, start, end)



df$chunk_num = cumsum( lag(df$end, default = FALSE))


df$ifs = grepl("^if\\(", syn, ignore.case = T)




chunk_nums = unique(df$chunk_num)


for(i in seq_along(chunk_nums)){

	chunk = chunk_nums[i]

	temp = df[df$chunk_num == chunk ,]

	multi_start = rle(temp$start)
	multi_start = multi_start$lengths[multi_start$values == "TRUE"]

	if(length(multi_start)>1){
		warning("'length(multi_start)>1' in chunk ", chunk)
		next()
	}

	if(multi_start>1){
		warning("'multi_start>1' in chunk ", chunk, " .")
		compute = temp$syn[str_detect(temp$syn, "^COMPUTE")]



	}


	multi_ifs = rle(temp$ifs)
	multi_ifs = multi_ifs$lengths[multi_ifs$values == "TRUE"]

	if(length(multi_ifs)>1){
		warning("'length(multi_ifs)>1' in chunk ", chunk)
		next()
	}








}





syn = syn %>%
	str_replace(., "STRING (\\w{1,}) \\(.*?\\)\\.",
							"\1 = "
							)




temp = syn[1:15]

temp %>%
	str_replace(., "STRING (\\w{1,}) \\(.*?\\)\\.",
							"\\1 = "
	)



	# str_replace(., "STRING (\\w{1,}) \\(.*?\\)\\.",
	# 						"\\1 = "
	# )
