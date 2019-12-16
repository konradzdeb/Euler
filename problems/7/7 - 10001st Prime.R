i <- 1
j <- 1

while (i != 10002) {
    j <- j + 1
    if (numbers::isPrime(j)) {
        i <- i + 1

    }

    if (j %% 1e4 == 0) {
        print(paste("Found primes:", i))
    }
}
