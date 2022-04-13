#' Poisson MLE Class
#'
#' An S4 class for a Possion Model
#'
#' @slot y a vector of positive values
#' @slot MLE The maximum likelihood estimator for the y vector.
#' @slot LL The log likelihood calculated from the y vector.
#' @slot SE The standard error for the MLE
#' @slot SEtype The method used to calculate the standard error (either basic or bootstrap).
#'
#' @return
#' @export
#'
#' @examples
setClass(
  Class = "PoisMLE",
  representation = representation(
    y = "numeric",
    MLE = "numeric",
    LL = "numeric",
    SE = "numeric",
    SEtype = "character"
  ),
  prototype = prototype(
    y = NA_real_,
    MLE = NA_real_,
    LL = NA_real_,
    SE = NA_real_,
    SEtype = "basic"

  )
)

setValidity("PoisMLE", function(object){
  if(any(y < 0)){
    stop("All y values must be greater than or equal to zero.")
  }
  if(object@MLE != mle(object@y)){
    stop("Invalid MLE")
  }
  if(object@LL != logLik(object@y, object@MLE)){
    stop("Invalid LL")
  }
  if(!(object@SEtype == "basic" | object@SEtype == "bootstrap")){
    stop("Invalid standard error type. Please use basic or bootstrap")
  }
}
)

#' @rdname PoisMLE
#' @export
setMethod("initialize", "PoisMLE",
          function(.Object, ...){
            value = methods::callNextMethod()
            methods::validObject(value)
            return(value)
          }
)




