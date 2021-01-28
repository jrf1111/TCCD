#' Not in
#'
#' @name nin
#'
#' @param x vector or NULL: the values to be matched. Long vectors are
#'   supported.
#' @param table vector or NULL: the values to be matched against. Long vectors
#'   are not supported.
#'
#' @details Similar to the function \code{%in%} from \code{base} but returns true if
#'   there is \strong{no} match. The functions \code{%nin%} and \code{%NIN%} are
#'   identical; the later is supplied so I don't have to lift my finger off
#'   the shift key. Uses \link[fastmatch]{fmatch} from \code{fastmatch} for speed.
#' @seealso \link[base]{match} from \code{base} and \link[fastmatch]{fmatch} from \code{fastmatch}
#' @export
"%nin%" <- function(x, table){fastmatch::fmatch(x, table, nomatch = 0) == 0}

#' @rdname nin
#' @export
"%NIN%" <- function(x, table){fastmatch::fmatch(x, table, nomatch = 0) == 0}





#' In
#'
#' @param x vector or NULL: the values to be matched. Long vectors are
#'   supported.
#' @param table vector or NULL: the values to be matched against. Long vectors
#'   are not supported.
#'
#' @details This is the exact same as \code{%fin%} from \code{fastmatch},
#'   but this way I don't have to lift my finger off the shift key.
#' @seealso  \link[fastmatch]{fmatch} from \code{fastmatch}
#' @export
"%IN%" <- function(x, table){fastmatch::fmatch(x, table, nomatch = 0) > 0}






#' Like
#'
#' @name like
#'
#' @param x a vector that can be coerced to character: the values to be matched against.
#' @param y a scalar that can be coerced to character: the value to be matched.
#'
#' @details The functions \code{%like%} and \code{%LIKE%} are
#'   identical; the later is supplied so I don't have to lift my finger off
#'   the shift key. Uses \link[stringr]{str_detect} from \code{stringr} to allow
#'   use of `stringr`'s [stringr::modifiers], such as `fixed`.
#'
#' @examples
#' LETTERS[1:5] %like% "A"  #TRUE FALSE FALSE FALSE FALSE
#' LETTERS[1:5] %LIKE% "A"  #Same
#' LETTERS[1:5] %LIKE% stringr::fixed("a", ignore_case = T)  #Same
#'
#' vec = c("")
#'
#'
#' @details The matching function ignores the case of the characters.
#'
#' @export
"%like%" <- function(x, y){
	stringr::str_detect(x, y)
	}


#' @rdname like
#' @export
"%LIKE%" <- function(x, y){
	stringr::str_detect(x, y)
}






#' Print a list of values to console
#'
#' @param x The values to be turned into a list
#' @param method Where is the list to be used? If `method = "discoverer"`
#'   (default for now), the list elements are surrounded by single quotes and
#'   separated by commas.  If `method = "orbit"`, the list elements are
#'   surrounded by double quotes and separated by semicolons.
#'
#' @examples
#' print_list(1:9, method = "disc") # '1', '2', '3', '4', '5', '6', '7', '8', '9'
#'
#' print_list(1:9, method = "o") # "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"
#' @export
#'
print_list = function(x, method = c("discoverer", "orbit")){

	method = match.arg(method)

	if(method == "discoverer"){
		x = unlist(x)
		x = as.character(x)
		x = paste(shQuote(x), collapse = ",")
		cat(x, sep = "")
	}

	if(method == "orbit"){
		x = unlist(x)
		x = as.character(x)
		x = paste(shQuote(x, type = "cmd"), collapse = ";")
		cat(x, sep = "")
	}


}
