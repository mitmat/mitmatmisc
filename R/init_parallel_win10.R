#' Initialize the parallel backend for Windows 10
#'
#' @param ncores The number of cores to use. Default NULL uses all but 1 core.
#'
#' @return Nothing.
#' @export
#'
#' @examples
#'
init_parallel_win10 <- function(ncores = NULL){
  library(parallel)
  library(doParallel)
  if(is.null(ncores)) {
    ncores <- detectCores() - 1
  }
  cluster <- makeCluster(ncores)
  registerDoParallel(cluster)
}
