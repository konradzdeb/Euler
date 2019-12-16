i <- 1
sumPrms <- NULL
while (i < 2e6) {
    if (numbers::isPrime(i)) {
        sumPrms <- sum(sumPrms, i)
    }
    i <- i + 1
    if (i %% 1e4 == 0) {
        print(paste("Current sum:", sumPrms, "for i:", i))
    }
}
