my_read = function(path, clean_names = TRUE, blanks_to_na = TRUE, ...){
	
	ext = gsub("(.*?)(\\..*?)$", "\\2", path)
	
	if(ext == ".csv"){
		res = data.table::fread(path)
		class(res) = "data.frame"
	} else if(ext == ".xlsx"){
		res = readxl::read_xlsx(path, guess_max = 10000)
	} else if(ext == ".xls"){
		res = readxl::read_xls(path, guess_max = 10000)
	} else {
		warning("Cannot import the file '", path, "'. Extention '", ext, "' not supported.")
		stop()
	}
	
	if(clean_names){
		colnames(res) = gsub(" ", "_", colnames(res))
		colnames(res) = gsub("/", "_", colnames(res))
	}
	
	if(blanks_to_na){
		res = sapply(res, function(x){
			x = trimws(x)
			x[x == ""] = NA
			x[x == " "] = NA
			x
		}
		)
		
		res = as.data.frame(res)
		
	}
	
	return(res)
	
}
