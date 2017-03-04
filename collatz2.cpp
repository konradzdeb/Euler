/*
 * =====================================================================================
 *
 *       Filename:  collatz2.cpp
 *
 *    Description:  Second approach to generating Collatz sequence
 *
 *        Version:  0.1
 *        Created:  08/01/2017 15:36:20
 *
 *         Author:  Konrad Zdeb (), konrad.zdeb@me.com
 *
 * =====================================================================================
 */

// Basic
#include <iostream>     // std::cout
#include <algorithm>    // std::find
#include <vector>       // std::vector 
#include <cstdlib>      // Convert input to integer
#include <boost/multiprecision/cpp_int.hpp> // Source big integer
using namespace std;
namespace mp = boost::multiprecision;


int main(int argc, char* argv[]) {

		// Variable definition
		mp::cpp_int n, index;
		// Sequence length
		int sqln = 1;
		// Max test value
		int maxTest;
		// Vectors of all lengths and all Ns
		std::vector<int> allLengths;
		std::vector<int> allNs;
		// Declare it for finding position
		std::vector<int>::iterator it;

		// Ask for value for which to search 
		int x = atoi(argv[1]);
		maxTest = x;

		// Build sequences
		for	(int i = 1; i <= maxTest; ++i) {
				// Show what's going on
				cout << endl << endl << "For i:";
				cout << i << endl;
				cout << "Sequence:";

				// Set n to current count
				n = i;
				// Reset sequence count
				sqln = 1;
				// Generate Collatz sequence
				while (n != 1) {
						cout << n << " ";
						if (n % 2 == 0) {
								n = n / 2;
								// Add element to seq length 
								++sqln;
						} else {
								n = 3 * n + 1;
								// Add element to seq length 
								++sqln;
						}

						// If arrived at negative go to next
						if (n < 0) {
							cout << "Breaking: ";
							cout << "i: " << i << " n: " << n << " Seq. length: " << sqln << endl;

							// Print lengths vector
							cout << "Lengths vector:" << endl;
							for (int j = 1; j < allLengths.size(); ++j) {
									cout << allLengths[j] << " ";
							}
							// Break 
							return maxTest;

						}
				}

		// Save length to vector
		allLengths.push_back (sqln);
		// Also store utilised n value
		allNs.push_back (i);
		}

		// Find max value of a vector
		double maxLen = *max_element(allLengths.begin(), allLengths.end());
		// Find position of the max value
		it = find (allLengths.begin(), allLengths.end(), maxLen);

		// Covert iterator to index
		index = it - allLengths.begin();

		// Return result
		cout << endl << endl << "Max length: " << maxLen << endl;
		// std::cout << "N for the max value: " << index;
		return 0;
}


