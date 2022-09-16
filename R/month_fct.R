#' Create a month factor column
#'
#' Returns the month abbreviations (Jan, Feb, ...) as a factor (so to keep the annual order),
#' with the option to define the first month (as factor level), so also hydrological years
#' are possible (Oct, Nov, Dec, Jan, ..). Requires a numeric input vector of months.
#'
#' @param month a vector of months (numeric)
#' @param first_month numeric, month which should be the first level (default: 1, i.e. Jan)
#'
#' @return Factor of same length as input.
#' @export
#'
#' @examples
#'
#' month <- sample(1:12, 30, replace = TRUE)
#' month
#' month_fct(month)
#' month_fct(month, 10) # note the level order
#'

month_fct <- function(month,
                      first_month = 1){

  xx_levels <- month.abb

  if(first_month != 1) {
    xx_levels <- xx_levels[c(first_month : 12, 1 : (first_month - 1))]
  }

  factor(month.abb[month], levels = xx_levels)

}
