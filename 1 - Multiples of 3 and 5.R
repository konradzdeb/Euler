# Function ----------------------------------------------------------------

findSumMultiples <- function(searchLimit = 1000) {
    res <- NULL
    j <- 1

    for (i in 1:searchLimit - 1) {
        if (any(i %% 3 == 0, i %% 5 == 0)) {
            res[j] <- i
            j <- j + 1

        }

        i <- i + 1
    }

    return(sum(res))
}

# Test --------------------------------------------------------------------

findSumMultiples(10)
findSumMultiples(1000)
