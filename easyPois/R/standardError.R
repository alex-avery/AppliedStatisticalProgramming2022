#' Standard Errors
#'
#' Calculates the standard error for a Poisson Model using basic or bootstrap standard errors.
#'
#' @param y a vector of positive values
#' @param SEtype The method used to calculate the standard error (either basic or bootstrap).
#' @param B number of samples used to estimate bootstrap standard errors.
#'
#' @return standard error
#'
#' @examples
#' y <- (1:10)
#' basic <- standardError(y = y, SEtype = "basic", B = 0)
#' bootstrap <- standardError(y = y, SEtype = "bootstrap", B = 10)
#'
#' @export
standardError <- function(y, SEtype, B){
  #get n
  n <- length(y)
  if(SEtype == "basic"){
    SE <- sqrt(mle(y) / n)
  }
  if(SEtype == "bootstrap"){
    #create matrix of samples
    samples <- matrix(unlist(lapply(c(1:B), function(x){sample(y, n, replace = TRUE)})), nrow = n, ncol = B)
    #calculate MLE for each sample
    mleSamples <- apply(samples, MARGIN = 2, FUN = mle)
    #find standard deviation
    mleSD <- stats::sd(mleSamples)
    SE <- mleSD
  }
  return(SE)
}
