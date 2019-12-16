a <- 1
b <- 2
c <- 3
i <- 1
continueChecking <- TRUE
lstPyt <- list("a" = a, "b" = b, "c" = c)
failedCombinations <- data.frame(a = a, b = b, c = c)

while (!all(sum(unlist(lstPyt)) == 1000,
            lstPyt$a ^ 2 + lstPyt$b ^ 2 == lstPyt$c ^ 2)) {
    failedCombinations[i,] <- unlist(lstPyt)
    lstPyt <-
        lapply(lstPyt, function(x) {
            x <- round(runif(
                n = 1,
                min = 1,
                max = 600
            ), 0)
        })
    while (any(duplicated(failedCombinations))) {
        lstPyt <-
            lapply(lstPyt, function(x) {
                x <- round(runif(
                    n = 1,
                    min = 1,
                    max = 600
                ), 0)
            })
    }
    # Counter
    if (i %% 1e4 == 0) {
        print(paste("Tested:", i))
    }
    i <- i + 1
}
