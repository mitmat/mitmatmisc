#' Convert factor from \code{\link{cut}} to numeric
#'
#' After using \code{\link{cut}}, this function will convert the resulting
#' interval to numeric values, which correspond to the middle of the interval.
#'
#' @param x factor, output from \code{\link{cut}}
#' @param digits optional, use \code{\link{round}} on the result with specific digits
#'
#' @return numeric vector of same length as x
#'
#' @importFrom magrittr %>%
#'
#' @export
#'
#' @examples
#' x <- runif(10, 0, 3000)
#' x_cut <- cut(x, breaks = 0:3 * 1000)
#' num_cut_fct(x_cut)
#'
#' # compare the differences:
#' data.frame(x, x_cut, num_cut_fct(x_cut))
#'
num_cut_fct <- function(x, digits){

  out <- data.table::tstrsplit(x, ",") %>%
    sapply(readr::parse_number) %>%
    rowMeans

  if(!missing(digits)) out <- round(out, digits = digits)

  out

}
