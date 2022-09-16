#' Add a season factor column to a data.table (by reference)
#'
#' Adds the four seasons DJF, SON, MAM, JJA as a factor (so to keep the annual order),
#' with the option to define the first season (factor level). Requires that input data
#' has column named "month", and adds a column named "season".
#'
#' @param ref_dat a \code{\link[data.table]{data.table}} for which to add season column
#' @param first_season character season, which should be the first level (default: "JJA")
#' @param add_n_days logical; if T, adds the number of days in each season (of a non-leap year)
#'
#' @return Nothing, adds column by reference.
#' @export
#' @import data.table
#' @importFrom utils hasName
#'
#' @examples
#'
#' dat <- data.table::data.table(month = sample(1:12, 30, replace = TRUE))
#'
#' add_season_fct(dat)
#' str(dat)
#'
#' add_season_fct(dat, first_season = "JJA", add_n_days = TRUE)
#' str(dat)

add_season_fct <- function(ref_dat,
                           first_season = "DJF",
                           add_n_days = FALSE){

  if(!is.data.table(ref_dat)) stop("Only works if input is a data.table")
  if(!hasName(ref_dat, "month")) stop("Input data does not have 'month' column")

  ref_dat[, season := season_fct(month, first_season = first_season)]

  if(add_n_days) {
    xx_season_days <- c(90, 90, rep(c(92, 92, 91), each = 3), 90)
    ref_dat[, n_days_season := xx_season_days[month]]
  }


}
