#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main() {
    
	// Variables
	bool continueChecking = true;
	int n, m;
	int j = 20;
	

    while (continueChecking) 
	{
		// Clean results vector;
		std::vector<int> modRes;
			
		for (n = 1, m = 20; n!=m; ++n) 
		{
			// Check divisions modulo
			if (j % n == 0) {
				// Store one if divides as desired
				modRes.push_back (1);
				std::cout << modRes.size();
			}
		}
		// Chec
		if (modRes.size() == 20) {
			// Check if all values of the vector are 1
			if(std::all_of(modRes.begin(), modRes.end(), [](int i) { return i==1; })) {
				// Print results
				std::cout << j;
				continueChecking = false;
			}
		}
		// Check next
		j++;
		if (j % 100 == 0) {
			printf ("%d ",j);
		}
  	}
}
