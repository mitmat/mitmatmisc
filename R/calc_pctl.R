#' Calculate percentiles
#'
#' Wrapper around \code{\link{quantile}} that returns a list and better names.
#' Thus, also easier usable within j of data.table's.
#'
#' @param x numeric vector
#' @param p same as probs in \code{\link{quantile}}
#' @param prefix prefix to add before percentile value (default: 'p')
#' @param ... other arguments passed to \code{\link{quantile}}
#'
#' @return list of percentiles with names "prefixX", where X is the
#'   percentile (probs*100).
#'
#'
#' @export
#'
#' @examples
#' x <- rnorm(1000)
#' calc_pctl(x)
#' calc_pctl(x, prefix = "pctl")
#'
calc_pctl <- function(x, p, prefix = "p", ...){

  if(missing(p)) p <- seq(0, 1, 0.25)

  vals <- stats::quantile(x, probs = p, ...)
  # names(vals) <- sprintf("p%02f", 100*p)
  names(vals) <- paste0(prefix, 100*p)

  as.list(vals)

}
