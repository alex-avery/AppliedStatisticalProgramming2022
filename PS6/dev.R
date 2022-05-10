#testing functionality of package

#loading dev tools package
library(devtools)

#let's use the presidential forecast data from the EBMAforecast package to test our package
library(EBMAforecast)
presForecast <- EBMAforecast::presidentialForecast

#load our package functions
load_all()

#define our X matrix
X <- as.matrix(presForecast[,1:6])

#define our Y vector
Y <- presForecast[,7]

#get our weights (we will weight all candidates equally)
weights <- replicate(dim(X)[2],1/dim(X)[2])

#now let's use our z hat function to get our z hat values 
test_zhat <- z_hat(x = X, y = Y, weights = weights, sd = 1)

#now using our test z hat values we will test our w hat function
test_what <- w_hat(z = test_zhat)

#finally we can test our EBMA function (we will use an arbitrary tolerance level)
test_ebma <- ebma(x = X, y = Y, weights = weights, sd = 1, tolerance = 0.0001)

print(test_ebma)
