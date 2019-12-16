#include <Rcpp.h>
#include <algorithm>
#include <iostream>
#include <vector>
#include <cmath>
using namespace Rcpp;

// Executes collataz sequence following the guidelines available through
// https://www.r-bloggers.com/euler-problem-14-longest-collatz-sequence/

// [[Rcpp::export]]
int collatzChain(int y) {

    // Define variables
    int collLength = 0;
    IntegerVector allLengths;
    int result, x;

    // Look for max collatz
    for (int j = 1; j < y; j++) {

        // Re-initiate collatz chain
        IntegerVector chain;

        // Assign test digit to x
        x = j;

        // Push first value to the chain
        chain.push_back(x);

        // Commence while loop checking for odd/even and adding numbers
        while(x != 1) {

            // Check if number is even
            if (x % 2 == 0) {
                // Collataz conjecture
                x = x / 2;
            }  else {
                // Collatz sequence
                x = 3 * x + 1;
            }

            // Add element to the vector
            chain.push_back(x);
        }

        // Return collatz chain length
        collLength = chain.size();

        // Show obtained chain
        std::cout << "Sequence for " << j << ": " << chain << std::endl;

    // Add length to the vector of all lengths
    allLengths.push_back(collLength);

    }

    // Get max element
    result = std::distance( allLengths.begin(), std::max_element(allLengths.begin(), allLengths.end()) + 1 );
    // Return the index of the max element
    return(result);
}

// Test function
/*** R
collatzChain(10)   # Should be 9
collatzChain(100)  # Should be 97
collatzChain(1000) # Should be 871

# Actual test, takes a while to compute
collatzChain(2e6 + 1)

*/
