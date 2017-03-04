



# Function ----------------------------------------------------------------

findLrgstPrmFac <- function(searchFigure = 600851475143) {
    i <- 1
    facs <- NULL
    j <- 1

    while (i < searchFigure - 1) {
        if (searchFigure %% i == 0) {
            facs[j] <- i
            j <- j + 1
        }
        i <- i + 1
        if (i %% 1e7 == 0) {
            print(c(i,j))
        }
    }
    return(facs)
}

# Tests -------------------------------------------------------------------

findLrgstPrmFac(searchFigure = 13195)
findLrgstPrmFac()

# Alternative -------------------------------------------------------------

max(numbers::primeFactors(600851475143))
