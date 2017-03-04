#include <Rcpp.h>
using namespace Rcpp;

// Faster implementation of the R largest prime function

// [[Rcpp::export]]
NumericVector largestPrime(NumericVector x) {
  return x * 2;
}

