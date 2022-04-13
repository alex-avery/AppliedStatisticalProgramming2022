#' Log Likelihood
#'
#' Calculating the Log Likelihood for a Poisson Model
#'
#' @param y a vector of positive values
#' @param lambda value for the expected lambda
#'
#' @return log likelihood value
#'
#' @example
#' y <- (1:10)
#' lambda <- mle(y)
#' logLik <- (y = y, lambda = lambda)
#'
#' @export
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
