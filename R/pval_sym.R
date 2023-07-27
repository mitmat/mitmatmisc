#' Create the p-value symbols from standard R summary functions
#'
#' Creates a vector of the same length as the input with the standard codes
#' for significance in R, as for example used in summary.lm
#'
#' @param p.values numeric p.values (between 0 and 1)
#'
#' @return Vector of symbols.
#' @export
#'
#' @examples
#'
#' pval <- c(runif(10, 0, 0.2))
#' cbind(pval, pval_sym(pval))

pval_sym <- function(p.values){

  stats::symnum(p.values,
                corr = FALSE,
                na = FALSE,
                cutpoints = c(0, 0.001, 0.01, 0.05, 0.1, 1),
                symbols = c("***", "**", "*", ".", " "))

}
