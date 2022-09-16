#' Returns a season factor
#'
#' Creates a factor with the four seasons DJF, SON, MAM, JJA (so to keep the annual order),
#' with the option to define the first season (factor level), from a vector of numeric/integer months.
#'
#' @param month numeric month
#' @param first_season character season, which should be the first level (default: "JJA")
#'
#' @return Factor vector of the same length as input.
#' @export
#'
#' @examples
#'
#' month <- sample(1:12, 30, replace = TRUE)
#' month
#' season_fct(month)
#' str(season_fct(month))
#'
#' season_fct(month, first_season = "JJA")
#' str(season_fct(month, first_season = "JJA"))

season_fct <- function(month,
                       first_season = "DJF"){

  xx_levels <- c("DJF", "MAM", "JJA", "SON")
  xx_season_name <- c("DJF", "DJF", rep(c("MAM", "JJA", "SON"), each = 3), "DJF")

  if(first_season != "DJF") {
    i_first <- which(xx_levels == first_season)
    xx_levels <- xx_levels[c(i_first : 4, 1 : (i_first - 1))]
  }

  factor(xx_season_name[month], levels = xx_levels)

}
