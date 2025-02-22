#include <Rcpp.h>
using namespace Rcpp;

//' Get z hat values using Rcpp
//'
//' @param x Numeric Matrix of x values
//' @param y Numeric Vector of actual values
//' @param weights Numeric Vector of weights for each model
//' @param sd Standard Deviation
//'
//' @export

// [[Rcpp::export]]

NumericMatrix z_hat(NumericMatrix x, NumericVector y, NumericVector weights, double sd){

  // create matrix
  NumericMatrix dnorm_matrix(x.nrow(), x.ncol());
  NumericMatrix out(x.nrow(), x.ncol());

  // get dnorm stat
  // code from easyEM package example
  for(int i = 0; i < x.nrow(); ++i){
    for(int j = 0; j < x.ncol(); ++j){
      double dnorm_value = R::dnorm(y[i], x(i,j), sd, FALSE);
      dnorm_matrix(i,j) = dnorm_value;
    }
  }

  // get row sums
  NumericVector sums(x.nrow());
  for(int i = 0; i < x.nrow(); ++i){
    double row_sum = 0;
    for(int j = 0; j < dnorm_matrix.ncol(); ++ j){
      row_sum += weights[j] * dnorm_matrix(i,j);
    }
    sums[i] = row_sum;
  }

  // get z hat values
  for(int i = 0; i < x.nrow(); ++i){
    for(int j = 0; j < x.ncol(); ++j){
      out(i,j) = weights[j] * dnorm_matrix(i,j) / sums[i];
    }
  }

  // return z hat matrix
  return out;
}

