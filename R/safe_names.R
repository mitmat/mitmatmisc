#' Make names file safe
#'
#' Replaces all non-alphanumeric characters with _ and removes all accents.
#'
#' @param x a vector of months (character)
#'
#' @return Vector of same length
#' @export
#'
#' @examples
#'
#' safe_names("x is.not-Fòàèin!")
#'

safe_names <- function(x){
  # replace non-alphanumeric with _
  x1 <- gsub("[^[:alnum:]]+", "_", x)

  # replace foreign accents to ASCII
  x2 <- stringi::stri_trans_general(x1, "latin-ascii")

  # return
  x2
}
