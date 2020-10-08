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
"%LIKE%" <- function(x, y){
	stringr::str_detect(x, y)
}




