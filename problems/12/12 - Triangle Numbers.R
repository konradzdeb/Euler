continueCheck <- TRUE
triangle <- 0
i <- 2

while (continueCheck) {
    triangle <- 1 + i
    mods <- triangle %% 1:i
    if (sum((mods == 0)) == 500) {
        continueCheck <- FALSE
    }
    i <- i + 1
    if (i %% 1e4 == 0) {
        print(paste("Checked so far:", i, "Modulo success:", sum((mods == 0))))
    }
}
