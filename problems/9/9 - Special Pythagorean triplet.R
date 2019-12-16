a <- 1
b <- 1
c <- 1
i <- 1
continueChecking <- TRUE

while (continueChecking) {
    # First condition
    while (!(a ^ 2 + b ^ 2 == c ^ 2)) {
        a <- round(runif(
            n = 1,
            min = 0,
            max = 1000
        ), 0)
        b <- round(runif(
            n = 1,
            min = 0,
            max = 1000
        ), 0)
        c <- round(runif(
            n = 1,
            min = 0,
            max = 1000
        ), 0)
        i <- i + 1

        # Second condition
        while (!(a < b)) {
            a <- round(runif(
                n = 1,
                min = 0,
                max = 1000
            ), 0)
            b <- round(runif(
                n = 1,
                min = 0,
                max = 1000
            ), 0)
            i <- i + 1

            # Third condition
            while (!(b < c)) {
                b <- round(runif(
                    n = 1,
                    min = 0,
                    max = 1000
                ), 0)
                c <- round(runif(
                    n = 1,
                    min = 0,
                    max = 1000
                ), 0)
                i <- i + 1

                # Fourth condition
                while (!(sum(a, b, c) == 1000)) {
                    a <- round(runif(
                        n = 1,
                        min = 0,
                        max = 1000
                    ), 0)
                    b <- round(runif(
                        n = 1,
                        min = 0,
                        max = 1000
                    ), 0)
                    c <- round(runif(
                        n = 1,
                        min = 0,
                        max = 1000
                    ), 0)
                    i <- i + 1
                }
            }
        }


    }

    # Counter
    i <- i + 1
    if (i %% 1e6 == 0) {
        print(paste("Tried:", i))
    }
}
