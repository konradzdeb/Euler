#include <Rcpp.h>
using namespace Rcpp;

// Sums up all elements of the matrix

// [[Rcpp::export]]
int sumMatElements(NumericMatrix M) {

    // Vars
    int sumM = 0;

    // Get matrix size
    int matsize = M.nrow() * M.ncol();

    // Show size
    Rcout << "Size: " << matsize << std::endl;

    // Add matrix values
    for (int i = 0; i < matsize; i++) {
        sumM = sumM + M[i];

        // Show current i and sum
        Rcout << "Current i: " << i << std::endl;
        Rcout << "Current si: " << sumM << std::endl;
    }

    return(sumM);
}


// Tests

/*** R

# Read file
vec <- read.fwf("13grid", widths = 50)
matVec <- as.matrix(vec)
sumMatElements(matVec)
*/
