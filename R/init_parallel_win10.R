#' Initialize the parallel backend for Windows 10
#'
#' @param ncores The number of cores to use. Default NULL uses all but 1 core.
#'
#' @return Nothing.
#' @export
#'
init_parallel_win10 <- function(ncores = NULL){

  if(is.null(ncores)) {
    ncores <- parallel::detectCores() - 1
  }

  cluster <- parallel::makeCluster(ncores)
  doParallel::registerDoParallel(cl = cluster)

}
