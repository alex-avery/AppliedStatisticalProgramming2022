setClass(
  Class = "Simpson",
  representation = representation(
    x = "numeric",
    y = "numeric",
    a = "numeric",
    b = "numeric",
    n = "numeric"
  ),
  prototype = prototype(
    x = NA_real_,
    y = NA_real_,
    a = NA_real_,
    b = NA_real_,
    n = NA_real_
  )
)

setValidity(
  "Simpson",
  function(object){
    #test that x and y are the same length
    test_xy_length <- length(object@x) == length(object@y)
    #test that n is equal to the length of vector x
    test_n_length <- n == length(object@x)
    #test that a and b are in vector x
    test_ab <- (object@a %in% object@x) & (object@b %in% object@x)
    if(!test_xy_length){
      stop("The vectors x and y are not of the same length.")}
    if(!test_n_length){
      stop("n is not the correct length.")}
    if(!test_ab){
      stop("a and/or b is not contained in x.")
    }
  }
)

setMethod(
  "initialize",
  "Simpson",
  function(.Object, ...){
    value = callNextMethod()
    validObject(value)
    return(value)
  }
)
