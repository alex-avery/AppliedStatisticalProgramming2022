#' Title
#'
#' @param y
#' @param SEtype
#' @param B
#'
#' @return
#' @export
#'
#' @examples
standardError <- function(y, SEtype, B){
  #get n
  n <- length(y)
  if(SEtype == "basic"){
    SE <- sqrt(mle(y) / n)
  }
  if(SEtyoe == "bootstrap"){
    #create matrix of samples
    samples <- matrix(unlist(lapply(c(1:B), FUN = sample(y, n, replace = TRUE))), nrow = n, ncol = B)
    #calculate MLE for each sample
    mleSamples <- apply(samples, MARGIN = 2, FUN = mle)
    #find standard deviation
    mleSD <- sd(mleSamples)
    SE <- mleSD
  }
  else{
    stop("Invalid SEtype argument. Please use basic or bootstrap.")
  }
  return(SE)
}
