#' Calculate percentiles
#'
#' Wrapper around \code{\link{quantile}} that returns a list and better names.
#' Thus, also easier usable within j of data.table's.
#'
#' @param x numeric vector
#' @param p same as probs in \code{\link{quantile}}
#' @param ... other arguments passed to \code{\link{quantile}}
#'
#' @return list of percentiles with names "pX", where X is the
#'   percentile (probs*100).
#'
#'
#' @export
#'
#' @examples
#' x <- rnorm(1000)
#' calc_pctl(x)
#'
calc_pctl <- function(x, p, ...){

  if(missing(p)) p <- seq(0, 1, 0.25)

  vals <- stats::quantile(x, probs = p, ...)
  # names(vals) <- sprintf("p%02f", 100*p)
  names(vals) <- paste0("p", 100*p)

  as.list(vals)

}
