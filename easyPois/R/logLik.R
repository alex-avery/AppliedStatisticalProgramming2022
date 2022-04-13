#' Title
#'
#' @param y
#' @param lambda
#'
#' @return
#' @export
#'
#' @examples
logLik <- function(y, lambda){
  #getting the number of observations
  n <- length(y)
  #first summation
  factsum <- sum(log(factorial(y)))
  #second summation
  lambdasum <- log(lambda) * sum(y)
  #loglikelihood function
  LL <- - (n * lambda) - factsum - lambdasum
  return(LL)
}
