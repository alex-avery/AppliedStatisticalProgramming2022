#integrateIt

setGeneric(
  name = "integrateIt",
  def = function(fun, x, a, b, n, rule){
             standardGeneric("integrateIt")
           }
  )

setMethod(
  "integrateIt",
  def = function(fun, x, a, b, n, rule){
    #get x_values vector
    x_values <- x[x >= a & x <= b]
    #get y_values vector
    y_values <- sapply(x_values, fun)
    #create h
    h <- (b - a) / n
    if(rule == "Trapezoid" | rule == "trapezoid"){
      #Trapezoidal Rule
      t_result <- (h / 2) * (y[1] + 2(sum(y[2:(n-1)])) + y[n])
    }
    if(rule == "Simpson" | rule == "simpson"){
      #Simpson Rule
      i <- 2
      s_result <- (h / 3) * (y[1] + 4(sum(y[seq(from = 2, to = n, by = 2)])) + 2(sum(y[seq(from = 3, to = n, by = 2)])) + y[n])
    }
    else{
      stop("Please use either Trapezoid or Simpson rule.")
    }
  }
)


test <- integrateIt(fun = (x^2), x = (1:80), a = 1, b = 80, n = 40, rule = "Trapezoid")

