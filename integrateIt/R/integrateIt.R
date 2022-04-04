#integrateIt

setGeneric(
  name = "integrateIt",
  def = function(fun, a, b, n, rule){
             standardGeneric("integrateIt")
           }
  )

setMethod(
  "integrateIt",
  def = function(x, y, a, b, n, rule){
    #create interval for integration
    interval <- seq(a, b, length.out = n)
    #create h
    h <- (b - a) / n
    if(rule == "Trapezoid" | rule == "trapezoid"){
      #Trapezoidal Rule
      t_result <- (h / 2) * ()
    }
  }
)


