mle <- function(y){
  numerator <- sum(y)
  denominator <- length(y)
  MLE <- numerator / denominator
  return(MLE)
}
