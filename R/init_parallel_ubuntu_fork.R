#' Initialize the parallel backend for Ubuntu (using forking)
#'
#' @param ncores The number of cores to use. Default NULL uses all but 1 core.
#'
#' @return Nothing.
#' @export
#'
init_parallel_ubuntu_fork <- function(ncores = NULL){

  if(is.null(ncores)) {
    ncores <- parallel::detectCores() - 1
  }

  doMC::registerDoMC(cores = ncores)

}
