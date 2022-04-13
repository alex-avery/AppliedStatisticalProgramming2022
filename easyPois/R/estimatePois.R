#' Estimate Poisson Model
#'
#' Calculates the log likelihood, maxiumum likelihood estimator, and standard error for a Poisson Model.
#'
#' @param y a vector of positive values
#' @param SEtype The method used to calculate the standard error (either basic or bootstrap).
#' @param B number of samples used to estimate bootstrap standard errors.
#'
#' @return PoisMLE class
#'
#' @seealso PoisMLEClass
#'
#' @examples
#' y <- c(1:10)
#' example1 <- estimatePois(y = y, SEtype = basic, B = 0)
#' example2 <- estimatePois(y = y, SEtype = bootstrap, B = 10)
#'
#' @export
setGeneric(
  name = "estimatePois",
  def = function(y, SEtype, B){
    standardGeneric("estimatePois")
  }
)

setMethod(
  "estimatePois",
  def = function(y, SEtype, B){
    return(new("PoisMLE",
                y = y,
                MLE = mle(y),
                LL = logLike(y, MLE),
                SE = standardError(y, SEtype, B),
                SEtype = SEtype
                )
          )
  }
)
