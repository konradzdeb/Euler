a <- round(runif(n = 1, min = 1, max = 1000), 0)
b <- round(runif(n = 1, min = a, max = 1000), 0)
c <- round(runif(n = 1, min = b, max = 1000), 0)
i <- 1

while (!all(a ^ 2 + b ^ 2 == c ^ 2,
            sum(a, b, c) == 1000)) {
    a <- round(runif(n = 1, min = 1, max = 1000), 0)
    b <- round(runif(n = 1, min = a, max = 1000), 0)
    c <- round(runif(n = 1, min = b, max = 1000), 0)

    i <- i + 1
    if (i %% 1e6 == 0) {
        print(i)
    }
}
prod(a,b,c)
