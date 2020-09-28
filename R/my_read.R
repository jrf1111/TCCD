#' Read in and partially clean data quickly and effortlessly
#'
#' @param path the file to be imported
#' @param clean_names Logical. Should the variable names be cleaned? Default is TRUE.
#' @param blanks_to_na Logical. Should blank/empty character strings be converted to NAs? Default is TRUE.
#' @param ... Other arguments passed to other methods
#'
#'
#' @return a \code{data.frame}
#'
#' @export
my_read = function(path, clean_names = TRUE, blanks_to_na = TRUE, ...){

	ext = tail(unlist(strsplit(path, ".", fixed = T)), n=1)

	if(ext == "csv"){
		res = data.table::fread(path, ...)
		class(res) = "data.frame"
	} else if(ext == "xlsx"){
		res = readxl::read_xlsx(path, guess_max = 10000, ...)
	} else if(ext == "xls"){
		res = readxl::read_xls(path, guess_max = 10000, ...)
	} else {
		warning("Cannot import the file '", path, "'. Extention '", ext, "' not supported.")
		stop()
	}

	if(clean_names){
		colnames(res) = gsub(" ", "_", colnames(res))
		colnames(res) = gsub("/", "_", colnames(res))
	}

	if(blanks_to_na){
		res = lapply(res, function(x){
			if(is.character(x)){
			x = trimws(x)
			x[x == ""] = NA
			x[x == " "] = NA
			x} else{x}
		}
		)

		res = as.data.frame(res)

	}

	return(res)

}
