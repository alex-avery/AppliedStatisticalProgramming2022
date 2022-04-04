
x<- 1:20
my_fun <- function(x){
  x^2
}
integrateIt(fun = my_fun, x = x, a = 1, b = 20, rule = "Trapezoid")

integrateIt(fun = my_fun, x =x , a =1, b = 20, rule = "Simpson")

integrateIt(fun = my_fun, x =x , a =1, b = 20, rule = "super")

integrateIt(fun = my_fun, x =x , a =1:4, b = 20, rule = "Simpson")

integrateIt(fun = my_fun, x = c(1, 2, NA, 4) , a =1, b = 4, rule = "Simpson")
