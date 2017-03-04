#include <Rcpp.h>
using namespace Rcpp;

//[[Rcpp::export]]
IntegerVector divCpp( int x ){
    IntegerVector divs = seq_len( x / 2 );
    IntegerVector out(0);
    for( int i = 0 ; i < divs.size(); i++){
        if( x % divs[i] == 0 )
            out.push_back( divs[i] );
    }
    return out;
}

/*** R
i <- 1
trian <- i * (i + 1)/2;

while (length(divCpp(trian)) < 4) {
    trian <- i * (i + 1)/2;
    i <- i + 1
}
*/

