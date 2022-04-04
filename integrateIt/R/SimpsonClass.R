#' Simpson Rule
#'
#' A technique for approximating the definite integral.
#'
#' @slot fun function defined by the user.
#' @slot x vector of numeric values.
#' @slot y vector of numeric values.
#' @slot result integer value.
#'
#' @export
#'
setClass(
  Class = "Simpson",
  representation = representation(
    fun = "function",
    x = "numeric",
    y = "numeric",
    result = "numeric"
  ),
  prototype = prototype(
    x = NA_real_,
    y = NA_real_,
    result = NA_real_
  )
)

setValidity(
  "Simpson",
  function(object){
    #test that x has no NA values
    test_x_na <- any(is.na(object@x))
    #test that y has no NA values
    test_y_na <- any(is.na(object@y))
    #test that result is an integer
    test_result <- length(object@result) != 1
    if(test_x_na){
      stop("There are NA values in the vector x.")}
    if(test_y_na){
      stop("There are NA values in the vector y.")}
    if(test_result){
      stop("Results must be an integer value.")
    }
  }
)

#' @export
setMethod(
  "initialize",
  "Simpson",
  function(.Object, ...){
    value = callNextMethod()
    validObject(value)
    return(value)
  }
)

#' @export
setMethod(
  "print",
  x = "Simpson",
  function(x){
    print(x@result)
  }
)
