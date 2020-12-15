#' Add subtotals to grouped operations
#'
#' @description
#' `with_subtotals()` appends a grouped data frame or data frame extension (e.g. a tibble)
#' to allow easy calculation of group totals and grand totals with `summarise()`.
#'
#' @param df A grouped data frame or data frame extension (e.g. a tibble)
#'
#' @param method a character string indicating which method is to be used.
#' Either "change" (the default) or "agg_level". `method` can be abbreviated.
#'
#' @return A grouped object of the same type as `df` but with additional rows
#' that contain group (sub)totals and grand totals. If `method = "agg_level"`,
#' a new variable called `.agg_level` will also be added.
#'
#'
#' @details
#' In order to create the extra subtotal and total groups, this function
#' has two unfortunate side effects.
#'
#' The first side effect is that it increases the number of rows of `df`
#' (sometimes drastically). This may result in performance issues and/or
#' exhaust available memory. Therefore, it may be advisable to pass a reduced
#' version of `df` containing only the variables necessary to perform the
#' desired operation(s). For example, by calling `select()` before
#' `group_by(...) %>% with_subtotals()`.
#'
#' The second side effect is that in order to create the total groups, it must
#' actually *make* the total group for each grouping variable. When `method = "change"`
#' (the default), this is achieved by (1) converting numeric variables to
#' characters or adding a new level to factors then (2) adding the new `total_`
#' group (a value that hopefully does not already exist in the grouping variable).
#' This is the default behavior because it allows results to be easily
#' passed to \link[tidyr]{pivot_wider} and because most use cases of `with_subtotals`
#' will not require (much) processing after calling `summarise(...)`.
#' If this behavior is problematic and the results need to have the same data
#' types as `df`, the user should specify `method = "agg_level"`.
#' Using `method = "agg_level"` will preserve the data types in `df` and it
#' will add a new variable called `.agg_level` to indicate the level of
#' aggregation in the result.
#'
#'
#'
#'
#' @examples
#'
#' library(tidyverse)
#' library(data.table)
#'
#' new = mtcars %>%
#'  	group_by(cyl, am) %>%
#'  	with_subtotals() %>%
#'  	summarise(
#'  	n = n(),
#'  	mean_mpg = mean(mpg)
#'  	) %>%
#'  	ungroup()
#'
#'
#' # the old, long, and error prone way
#' old <- data.table::rbindlist(
#'   list(
#'     mtcars %>%
#'       group_by(cyl, am) %>%
#'       summarise(
#'         n = n(),
#'         mean_mpg = mean(mpg)
#'       ) %>%
#'       ungroup(),
#'
#'     mtcars %>%
#'       group_by(cyl) %>%
#'       summarise(
#'         n = n(),
#'         mean_mpg = mean(mpg),
#'         am = "total_"
#'       ) %>%
#'       ungroup(),
#'
#'     mtcars %>%
#'       group_by(am) %>%
#'       summarise(
#'         n = n(),
#'         mean_mpg = mean(mpg),
#'         cyl = "total_"
#'       ) %>%
#'       ungroup(),
#'
#'     mtcars %>%
#'       summarise(
#'         n = n(),
#'         mean_mpg = mean(mpg),
#'         am = "total_",
#'         cyl = "total_"
#'       ) %>%
#'       ungroup()
#'   ),
#'   use.names = TRUE
#' )
#'
#'
#' new <- new %>% arrange_all()
#' old <- old %>% arrange_all()
#'
#' all.equal(old, new, check.attributes = FALSE) # TRUE
#'
#'
#'
#'
#'
#' # comparing `method = "change"` vs. `method = "agg_level"`
#' change <- mtcars %>%
#'   group_by(cyl, am) %>%
#'   with_subtotals(method = "change") %>% # the default
#'   summarise(
#'     n = n(),
#'     mean_mpg = mean(mpg)
#'   ) %>%
#'   ungroup()
#'
#' agg_level <- mtcars %>%
#'   group_by(cyl, am) %>%
#'   with_subtotals(method = "agg_level") %>%
#'   summarise(
#'     n = n(),
#'     mean_mpg = mean(mpg)
#'   ) %>%
#'   ungroup()
#'
#' # agg_level maintains the original data types and
#' # agg_level looks better when printed as is
#' change
#' agg_level
#'
#'
#' # but change makes it easier to pivot_wider
#' change %>% pivot_wider(
#'   id_cols = cyl,
#'   names_from = am,
#'   names_prefix = "am_",
#'   values_from = c(n, mean_mpg)
#' )
#'
#'
#' agg_level %>% pivot_wider(
#'   id_cols = c(.agg_level, cyl),
#'   names_from = am,
#'   names_prefix = "am_",
#'   values_from = c(n, mean_mpg)
#' )
#'
#'
#'
#'
#' # both `method = "change"` and `method = "agg_level"`
#' # work better than other potential solutions
#' # if there are NAs in the grouping variables
#' #(see https://stackoverflow.com/questions/31164350)
#'
#' df <- mtcars
#' df$carb[3] <- NA # was 1
#'
#' # see rows 3 & 4; you can't tell what is a subtotal vs. missing data
#' bind_rows(
#'   df %>%
#'     group_by(cyl, carb) %>%
#'     summarise(Mean = mean(disp)),
#'   df %>%
#'     group_by(cyl) %>%
#'     summarise(carb = NA, Mean = mean(disp)),
#'   df %>%
#'     group_by(carb) %>%
#'     summarise(cyl = NA, Mean = mean(disp))
#' ) %>% arrange(cyl, carb)
#'
#' # compare that to using `with_subtotals()`
#' df %>%
#'   group_by(cyl, carb) %>%
#'   with_subtotals() %>%
#'   summarise(Mean = mean(disp))
#'
#' df %>%
#'   group_by(cyl, carb) %>%
#'   with_subtotals(method = "agg_level") %>%
#'   summarise(Mean = mean(disp))
#' @export
with_subtotals <- function(df, method = c("change", "agg_level")) {
  method <- match.arg(method)


  # get the grouping vars
  groups <- dplyr::group_vars(df)

  if (length(groups) == 0) {
    message("No grouping variables specified in `with_subtotals()`. Returning object unchanged.")
    return(df)
  }

  df <- dplyr::ungroup(df)


  if (method == "change") {
    if (length(groups) > 1) {

      # a backup for getting overall totals later
      original_df <- dplyr::ungroup(df)


      # for each group var, make a new 'total' group
      total <- function(df, group) {
        var <- rlang::sym(group)

        if (is.factor(dplyr::pull(df, {{ group }}))) {
          df <- df %>% dplyr::mutate(
            {{ group }} := forcats::fct_expand(!!var, "total_")
          )
        } else if (!is.character(dplyr::pull(df, {{ group }}))) {
          df <- df %>% dplyr::mutate({{ group }} := as.character(!!var))
        }

        df %>% dplyr::mutate({{ group }} := "total_")
      }

      totals <- data.table::rbindlist(
        lapply(groups, function(x) {
          total(df, x)
        }),
        use.names = TRUE, fill = TRUE
      )

      # make a 'grand total' group
      grand_total <- original_df %>% dplyr::mutate_at(dplyr::vars(!!!groups), ~"total_")

      # add the total and grand total groups to the data
      old_classes <- class(df)
      df <- data.table::rbindlist(list(df, totals, grand_total))
      class(df) <- old_classes
      rm(original_df, totals, grand_total)
    }


    if (length(groups) == 1) {

      # make a new 'total' group for the one group var
      group <- groups[1]
      var <- rlang::sym(group)

      if (is.factor(dplyr::pull(df, {{ group }}))) {
        df <- df %>% dplyr::mutate(
          {{ group }} := forcats::fct_expand(!!var, "total_")
        )
      } else if (!is.character(dplyr::pull(df, {{ group }}))) {
        df <- df %>% dplyr::mutate({{ group }} := as.character(!!var))
      }

      temp <- df %>% dplyr::mutate({{ group }} := "total_")

      # add the total to the data
      old_classes <- class(df)
      df <- data.table::rbindlist(list(df, temp))
      class(df) <- old_classes
      rm(temp)
    }

    # restore grouping variables
    df <- dplyr::group_by(df, !!!rlang::syms(groups))
  }

  if (method == "agg_level") {
    if (length(groups) > 1) {

      # a backup for getting overall totals later
      original_df <- dplyr::ungroup(df)


      # for each group var, make a new 'subtotal' group
      total <- function(df, group) {
        df %>% dplyr::mutate(
          !!group := NA,
          .agg_level = "2 subtotal"
        )
      }

      totals <- data.table::rbindlist(
        lapply(groups, function(x) {
          total(df, group = x)
        }),
        use.names = TRUE, fill = TRUE
      )




      # make a 'grand total' group
      grand_total <- original_df %>%
        dplyr::mutate_at(dplyr::vars(!!!groups), ~NA) %>%
        dplyr::mutate(.agg_level = "3 total")




      # add the total and grand total groups to the data
      old_classes <- class(df)
      df <- df %>% dplyr::mutate(.agg_level = "1 detail")
      df <- data.table::rbindlist(list(df, totals, grand_total), fill = TRUE)
      class(df) <- old_classes
      rm(original_df, totals, grand_total)
    }


    if (length(groups) == 1) {

      # make a new 'total' group for the one group var
      group <- groups[1]

      grand_total <- df %>%
        dplyr::mutate(
          !!group := NA,
          .agg_level = "3 total"
        )

      # add the total to the data
      old_classes <- class(df)
      df <- df %>% dplyr::mutate(.agg_level = "1 detail")
      df <- data.table::rbindlist(list(df, grand_total), fill = T)
      class(df) <- old_classes
      rm(grand_total)
    }

    # restore grouping variables
    df <- dplyr::group_by(df, .agg_level, !!!rlang::syms(groups))
  }

  return(df)
}
