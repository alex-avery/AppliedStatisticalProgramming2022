#include <Rcpp.h>
#include "z_hat.h"
#include "w_hat.h"
using namespace Rcpp;

//' Function to perform EBMA using Rcpp
//'
//' @param x Numeric Matrix of x values
//' @param y Numeric Vector of actual values
//' @param weights Numeric Vector of weights for each model
//' @param sd Standard Deviation
//' @param tolerance Specified tolerance level 
//'
//' @export

// [[Rcpp::export]]

NumericVector ebma(NumericMatrix x, NumericVector y, NumericVector weights, double sd, double tolerance){

  // Our threshold will tell us whether or not the difference between the old &
  // new weights exceeds the tolerance level
  bool threshold = FALSE;
  int iterations = 0;

  // get z hat values and updated weights
  while(threshold == FALSE){
    NumericMatrix ebma_zhats = z_hat(x, y, weights, sd);
    NumericVector update_weights = w_hat(ebma_zhats);
    // create test to see if the difference be
    LogicalVector diff = (abs((weights - update_weights)) < tolerance);
    if(is_true(all(diff))){
      threshold = TRUE;
    }
    else{
      weights = update_weights;
    }
    iterations = iterations + 1;
  }
  return weights;
}




