#testing functionality of package

#loading dev tools package
library(devtools)

#let's use the presidential forecast data from the EBMAforecast package to test our package
library(EBMAforecast)
presForecast <- EBMAforecast::presidentialForecast

#load our package functions
load_all()
#Uh-oh we get an error