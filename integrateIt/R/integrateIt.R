#integrateIt

setGeneric(
  name = "integrateIt",
  def = function(fun, a, b, n, rule){
             standardGeneric("integrateIt")
           }
  )

setMethod(
  "integrateIt",
  def = function(fun, a, b, n, rule){
    #create interval for integration
    interval <- seq(a, b, length.out = n)
    #create h
    h <- (b - a) / n
    if(rule == "Trapezoid" | rule == "trapezoid"){
      #Trapezoidal Rule
      t_result <- (h / 2) * (fun(interval[1]) + 2(sum(fun(interval[2:(n-1)]))) + fun(interval[n]))
    }
    if(rule == "Simpson" | rule == "simpson"){
      #Simpson Rule
      i <- 2
      s_result <- (h / 3) * (fun(interval[1]) + 4(sum(fun(interval[seq(from = 2, to = n, by = 2)]))) + 2(sum(fun(interval[from = 3, to = n, by = 2]))) + fun(interval[n]))
    }
    else{
      stop("Please use either Trapezoid or Simpson rule.")
    }
  }
)
