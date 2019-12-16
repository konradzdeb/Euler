// Solution to https://projecteuler.net/problem=14
// Finding longest Collatz sequence 

#include <iostream>
using namespace std;

int main() {
		// Variables
		int maxNum, n, j, k, max, maxValueIndex;
		// Matrix to store all i values and n counts
		int arrCounts[13][1];
		
		// Assign search value for the exericse
		maxNum = 14;

		// For loop to generate Collatz sequences
		for (int i = 1; i < maxNum; i++) {

				// Reset j
				j = 0;

				// Loop until n is 1
				while (n > 1) {

						// Obtain Collatz sequence for that i
						if (i % 2 == 0) {
								// Number is even
								n = n / 2;
								// Count one n
								j++;
								// Show n
								cout << n << endl;

						} else {
								// Number is odd
								n = 3 * n + 1;
								// Count one n
								j++;
								// Show n
								cout << n << endl;

						}

				}
				
				// Store to the Matrix
				arrCounts[i][0] = i;
				arrCounts[i][1] = j;
		}

		// Find maximum value in the array
		for (k = 0; k < 13;  k++)
		{
				if (arrCounts[k][1] > max)
				{
						max = arrCounts[k][1];
						maxValueIndex = k;
				}
		}

		cout << "The maximum value in the array is " << max << endl;
		cout << "The other value in the array is " << arrCounts[maxValueIndex][1] << endl;
		return 0;
}

