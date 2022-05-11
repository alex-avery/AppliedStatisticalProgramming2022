#include <Rcpp.h>
using namespace Rcpp;

//' Get weighted values using Rcpp
//'
//' @param z Numeric Matrix of z values

//'
//' @export

// [[Rcpp::export]]

NumericVector w_hat(NumericMatrix z){
  // specify row and column values
  int rows = z.nrow();
  int cols = z.ncol();
  NumericVector out(cols);

  // get w hat values
  for(int j = 0; j < cols; ++j){
    double weight = 0;
    for (int i = 0; i < rows; ++i){
      weight += z(i,j);
    }
    out[j] = weight / rows;
  }
  // return w hat values
  return out;
}
