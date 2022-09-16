#' Initialize the parallel backend for Ubuntu
#'
#' @param ncores The number of cores to use. Default NULL uses all but 1 core.
#'
#' @return Nothing.
#' @export
#'
init_parallel_ubuntu <- function(ncores = NULL){

  if(is.null(ncores)) {
    ncores <- parallel::detectCores() - 1
  }

  doParallel::registerDoParallel(cores = ncores)

}
