

# Function ----------------------------------------------------------------

evenFibonSum <- function(searchLimit = 4e6) {
    fibSeq <- c(1,2)

    while (fibSeq[length(fibSeq)] < searchLimit) {
        fibSeq <- c(fibSeq,
                    fibSeq[length(fibSeq) - 1] + fibSeq[length(fibSeq)])
    }

    # Check elements and sum
    res <- fibSeq[(fibSeq %% 2) == 0]
    return(sum(res))
}

# Tests -------------------------------------------------------------------

evenFibonSum(10)
evenFibonSum(4e6)
