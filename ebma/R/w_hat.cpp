#include <Rcpp.h>
using namespace Rcpp;

NumericVector w_hat(NumericMatrix z_hat){
  // specify row and column values
  int rows = z_hat.nrow();
  int cols = z_hat.ncol();
  NumericVector out(cols);

  // get w hat values
  for(int j = 0; j < cols; ++j){
    double weight = 0;
    for (int i = 0; i < rows; ++i){
      weight += z_hat(i,j);
    }
    out[j] = weight / rows;
  }
  // return w hat values
  return out;
}
