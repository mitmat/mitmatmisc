#' Initialize the parallel backend for Ubuntu
#'
#' @param ncores The number of cores to use. Default NULL uses all but 1 core.
#'
#' @return Nothing.
#' @export
#'
#' @examples
#'
init_parallel_ubuntu <- function(ncores = NULL){
  library(doParallel)
  library(foreach)
  if(is.null(ncores)) {
    ncores <- parallel::detectCores() - 1
  }
  registerDoParallel(cores = ncores)
}
