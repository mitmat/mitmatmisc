#' Add a month factor column to a data.table (by reference)
#'
#' Adds the month abbreviations (Jan, Feb, ...) as a factor (so to keep the annual order),
#' with the option to define the first month (as factor level), so also hydrological years
#' are possible (Oct, Nov, Dec, Jan, ..). Requires that input data has either a "month"
#' or "date" column, and adds a column named "month_fct".
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
#' dat <- data.table::data.table(month = sample(1:12, 30, replace = TRUE))
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
  if(!hasName(ref_dat, "month") & !hasName(ref_dat, "date")) {
    stop("Input data must have a 'month' or 'date' column")
  }

  if(hasName(ref_dat, "month")){
    ref_dat[, month_fct := month_fct(month, first_month = first_month)]
  } else {
    ref_dat[, month_fct := month_fct(month(date), first_month = first_month)]
  }



}
