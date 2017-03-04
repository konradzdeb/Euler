# Read series number as character vector
seriesNum <- unlist(strsplit(readLines("prob8_seriesNum.txt"), ""))

# Create products
prods <- list()

for (i in 1:length(seriesNum)) {
    prods[[i]] <-
        prod(as.numeric(unlist(strsplit(seriesNum[i:(i + 13)], "")))[1:13])
    i <- i + 1
}

# Get max
prods <- unlist(prods)
max(prods, na.rm = TRUE)
