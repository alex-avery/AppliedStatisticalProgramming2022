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
