continueChecking <- TRUE
checkNum <- 20;
while (continueChecking) {
    # Increase counter
    checkNum <- checkNum + 1;
    # Check for 1:20
    if (all(checkNum %% 1:20 == 0)) {
        continueChecking <- FALSE
    }
    # Counter every million
    if (checkNum %% 1e6 == 0) {
        print(checkNum)
    }
}
