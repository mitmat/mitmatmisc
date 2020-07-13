#' Add a month factor column to a data.table (by reference)
#'
#' Adds the month abbreviations (Jan, Feb, ...) as a factor (so to keep the annual order),
#' with the option to define the first month (as factor level), so also hydrological years
#' are possible (Oct, Nov, Dec, Jan, ..). Requires that input data has column named "month",
#' and adds a column named "month_fct".
#'
#' @param ref_dat a \code{\link[data.table]{data.table}} for which to add month_fct column
#' @param first_month numeric, month which should be the first level (default: 1, i.e. Jan)
#'
#' @return Nothing, adds column by reference.
#' @export
#' @import data.table
#'
#' @examples
#'
#' dat <- data.table(month = sample(1:12, 30, replace = T))
#'
#' add_month_fct(dat)
#' str(dat)
#'
#' add_month_fct(dat, 10)
#' summary(dat$month_fct)
#'

add_month_fct <- function(ref_dat,
                          first_month = 1){

  if(!is.data.table(ref_dat)) stop("Only works if input is a data.table")
  if(!hasName(ref_dat, "month")) stop("Input data does not have 'month' column")

  xx_levels <- month.abb

  if(first_month != 1) {
    xx_levels <- xx_levels[c(first_month : 12, 1 : (first_month - 1))]
  }

  ref_dat[, month_fct := factor(month.abb[month], levels = xx_levels)]

}
