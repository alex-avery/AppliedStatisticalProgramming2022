% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimatePois.R
\name{estimatePois}
\alias{estimatePois}
\title{Estimate Poisson Model}
\usage{
estimatePois(y, SEtype, B)
}
\arguments{
\item{y}{a vector of positive values}

\item{SEtype}{The method used to calculate the standard error (either basic or bootstrap).}

\item{B}{number of samples used to estimate bootstrap standard errors.}
}
\value{
PoisMLE class
}
\description{
Calculates the log likelihood, maxiumum likelihood estimator, and standard error for a Poisson Model.
}
\examples{
y <- (1:10)
example1 <- estimatePois(y = y, SEtype = "basic", B = 0)
example2 <- estimatePois(y = y, SEtype = "bootstrap", B = 10)

}
\seealso{
PoisMLEClass
}
