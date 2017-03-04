#include <Rcpp.h>
using namespace Rcpp;

// Collatez sequence

// [[Rcpp::export]]
int collatz(int startNumber) {

    // Initialize stuff
    std::vector<int> collatz;
    int n = startNumber ;

    // Create collatz figures
    while(n != 0 ) {

        // Create new vector
        collatz.clear()

        // Create Ns
        if (n % 2 == 0) {
            n = n / 2;
        } else {
            n = 3 * n + 1;
        }
        // Push to collattz
        collatz.push_back(n);
        // Discount n
        --n;
    }
    return(n);
}


// Test

/*** R
collatz(42)
*/
