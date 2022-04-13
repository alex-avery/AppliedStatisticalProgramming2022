#' Maximum Likelihood Estimate
#'
#' Calculates the maximum likelihood estimate for a Possion Model
#'
#' @param y a vector of positive values
#'
#' @return maximum likelihood estimate
#'
#' @example
#' y <- (1:10)
#' y_mle <- mle(y)
#'
#' @export
mle <- function(y){
  numerator <- sum(y)
  denominator <- length(y)
  MLE <- numerator / denominator
  return(MLE)
}
