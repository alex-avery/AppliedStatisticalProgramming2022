#integrateIt

setGeneric(
  name = "integrateIt",
  def = function(x, y, a, b, rule){
             standardGeneric("integrateIt")
           }
  )

setMethod("integrateIt",
          definition = function(x, y, a, b, rule){
            interval <- 
          }
          )

Takes four arguments: a vector of values(x), a vector of evaluated values(f(x) =y),starting/ending values(a, b), and aRuleargument that can be either "Trapezoid" or "Simpson".3
ii.Have three outputs: an object of classTrapezoidor classSimpson, the values ofxandy, andthe resultiii. Both classes should have validation methods that include a few appropriate testsiv.you will need to create aninitializefunction for each class, which will be used internallybyintegrateI