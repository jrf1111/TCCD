#' Not in
#'
#' @name nin
#'
#' @param x vector or NULL: the values to be matched. Long vectors are
#'   supported.
#' @param table vector or NULL: the values to be matched against. Long vectors
#'   are not supported.
#'
#' @details Similar to the function \code{%in%} from base but returns true if
#'   there is no match. The functions \code{%nin%} and \code{%NIN%} are
#'   identical; the later is supplied so I don't have to lift my finger off
#'   the shift key.
#' @seealso \link[base]{match}
#' @export
"%nin%" <- function(x, table){match(x, table, nomatch = 0) == 0}

#' @rdname nin
"%NIN%" <- function(x, table){match(x, table, nomatch = 0) == 0}





#' In
#'
#' @param x vector or NULL: the values to be matched. Long vectors are
#'   supported.
#' @param table vector or NULL: the values to be matched against. Long vectors
#'   are not supported.
#'
#' @details This is the exact same as the function \code{%in%} from base
#'   but this way I don't have to lift my finger off the shift key.
#' @seealso \link[base]{match}
#' @export
"%IN%" <- function(x, table){match(x, table, nomatch = 0) > 0}






#' Like
#'
#' @name like
#'
#' @param x a vector that can be coerced to character: the values to be matched against.
#' @param y a scalar that can be coerced to character: the value to be matched.
#'
#' @details The functions \code{%like%} and \code{%LIKE%} are
#'   identical; the later is supplied so I don't have to lift my finger off
#'   the shift key.
#'
#' @examples
#' LETTERS[1:5] %like% "A"  #TRUE FALSE FALSE FALSE FALSE
#' LETTERS[1:5] %LIKE% "A"  #TRUE FALSE FALSE FALSE FALSE
#' LETTERS[1:5] %like% "a"  #TRUE FALSE FALSE FALSE FALSE
#' LETTERS[1:5] %like% "C"  #FALSE FALSE TRUE FALSE FALSE
#' LETTERS[1:5] %like% "X"  #FALSE FALSE FALSE FALSE FALSE
#' "abcdX" %like% "X"       #TRUE
#'
#' @details The matching function ignores the case of the characters.
#'
#' @export
"%like%" <- function(x, y){
	if(!is.character(x)){x = as.character(x)}
	if(!is.character(y)){y = as.character(y)}
	grepl(y, x, ignore.case = T)
	}


#' @rdname like
"%LIKE%" <- function(x, y){
	if(!is.character(x)){x = as.character(x)}
	if(!is.character(y)){y = as.character(y)}
	grepl(y, x, ignore.case = T)
}




