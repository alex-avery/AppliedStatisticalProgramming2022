#integrateIt

setGeneric(
  name = "integrateIt",
  def = function(fun, x, a, b, rule){
             standardGeneric("integrateIt")
           }
  )

setMethod(
  "integrateIt",
  def = function(fun, x, a, b, rule){
    #get x_values vector
    x_values <- x[x >= a & x <= b]
    #get y_values vector
    y_values <- sapply(x_values, fun)
    #get n value
    n <- length(x_values)
    #create h
    h <- (b - a) / n
    if(rule == "Trapezoid" | rule == "trapezoid"){
      #Trapezoidal Rule
      t_result <- (h / 2) * (y_values[1] + 2(sum(y_values[2:(n - 1)])) + y_values[n])
    }
    if(rule == "Simpson" | rule == "simpson"){
      #Simpson Rule
      s_result <- (h / 3) * (y_values[1] + 4(sum(y_values[seq(from = 2, to = (n-1), by = 2)])) + 2(sum(y_values[seq(from= 3, to = (n-1), by = 2)])) + y_values[n])
    }
    else{
      stop("Please use either Trapezoid or Simpson rule.")
    }
  }
)



