#include <Rcpp.h>
#include "z_hat.cpp"
#include "w_hat.cpp"
using namespace Rcpp;

// [[Rcpp::export]]

NumericVector ebma(NumericMatrix x, NumericVector y, NumericVector weights, double sd, double tolerance){

  // Our threshold will tell us whether or not the difference between the old &
  // new weights exceeds the tolerance level
  bool threshold = FALSE;
  int iterations = 0;

  // get z hat values and updated weights
  while(threshold == FALSE){
    NumericMatrix z_hats = z_hat(x, y, sd);
    NumericVector update_weights = w_hat(z_hats);
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




