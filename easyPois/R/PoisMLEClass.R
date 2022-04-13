#' Title
#'
#' @slot y numeric.
#' @slot MLE numeric.
#' @slot LL numeric.
#' @slot SE numeric.
#' @slot SEtype character.
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
    y = NA,
    MLE = NA,
    LL = NA,
    SE = NA,
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
}
)

#' @rdname PoisMLE
#' @export
setMethod("initialize", "PoisMLE",
          function(.Object, ...){
            value = callNextMethod()
            validObject(value)
            return(value)
          }
)
