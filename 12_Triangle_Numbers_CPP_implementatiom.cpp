#include <Rcpp.h>
using namespace Rcpp;

// Utilises CPP implementation to work around memory limitations

// [[Rcpp::export]]
int divisors(int soughtDivisors) {

  // Vars
  int divs = 1;
  int i = 1;
  int trian;
  int k = i - 1;
  int j;

  // Define loop to check divisors
  while (divs < soughtDivisors) {


    // Compute triangle for given i
    trian = i * (i + 1)/2;

    // Msg
    if (i % 1000 == 0) {
        Rcout << "Current triangle: " << trian << std::endl;
    }

    // Rest divs
    divs = 0;
    j = 1;

    while(j <= trian) {

        // Check if modulo == 0
        if (trian % j == 0) {

            // For each count increase divisors
            ++divs;
        }

        // Inc j
        ++j;
    }

    // Increase counter
    ++i;
  }
  k = i - 1;
  return(k * (k + 1)/2);
}

/*** R
divisors(soughtDivisors = 1)
divisors(soughtDivisors = 2)
divisors(soughtDivisors = 4)
divisors(soughtDivisors = 5)
divisors(soughtDivisors = 6)
divisors(soughtDivisors = 500)
# divisors(soughtDivisors = 501)
    */
