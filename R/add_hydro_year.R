#' Add a hydrological year column to a data.table (by reference)
#'
#' Adds a hydrological year starting at a specific month (default = 10). The hydrological year
#' is identified by the starting month, e.g. 2002-10 to 2002-12 and 2003-01 to 2003-09
#' will have the same hydro_year=2002.
#'
#' Requires that input data has column(s) "date" or c("year", "month").
#'
#' @param ref_dat a \code{\link[data.table]{data.table}} for which to add hydro_year column
#' @param start_month numeric, which should be the first month of the hydro_year
#'
#' @return Nothing, adds column by reference.
#' @export
#' @import data.table
#'
#' @examples
#'
#'
#' dat <- data.table(date = lubridate::ymd(c("2002-08-15", "2002-09-30", "2002-10-01", "2002-12-31",
#'                                           "2003-01-01", "2003-08-15", "2003-09-30", "2003-10-01")))
#' dat
#' add_hydro_year(dat)
#' dat
#' add_hydro_year(dat, start_month = 9)
#' dat

add_hydro_year <- function(ref_dat,
                           start_month = 10){

  if(!is.data.table(ref_dat)) stop("Only works if input is a data.table")
  if(!(hasName(ref_dat, "date") | all(hasName(ref_dat, c("year", "month"))))) {
      stop("Input data must have 'date' or c('year','month') as column(s)")
  }

  if(hasName(ref_dat, "date")){
    ref_dat[, hydro_year := year(date)]
    ref_dat[month(date) < start_month, hydro_year := hydro_year - 1L]
  } else {
    ref_dat[, hydro_year := year]
    ref_dat[month < start_month, hydro_year := hydro_year - 1L]
  }

}
