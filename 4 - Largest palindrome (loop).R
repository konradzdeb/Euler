# Loop approach -----------------------------------------------------------

checkAnother <- FALSE
i <- 999
j <- 999

while (!checkAnother) {
    product <- i * j
    # Check
    productSplit <- unlist(strsplit(as.character(product), ""))
    if (length(productSplit) %% 2 == 0) {
        leftSide <- productSplit[1:(length(productSplit) / 2)]
        rightSide <-
            productSplit[(length(productSplit) / 2 + 1):length(productSplit)]
        checkAnother <- all(leftSide == rightSide)
    } else {
        checkAnother <- FALSE
    }
    i <- i - 1
    j <- j - 1
    print(paste("i:", i, "j:", j))
}
