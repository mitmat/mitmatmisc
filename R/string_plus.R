#' String plus (similar to python + operator for strings)
#'
#' @param x,y String to concatenate
#'
#' @return The concatenated string.
#' @export
#'
#' @examples
#' "Hello" %+% " " %+% "world!"

'%+%' <- function(x, y) paste0(x, y)
