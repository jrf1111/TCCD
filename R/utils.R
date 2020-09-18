#' Not In
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
#'
#'
"%nin%" <- function(x, table){match(x, table, nomatch = 0) == 0}
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
