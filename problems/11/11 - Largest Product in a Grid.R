# Create matrix from the problem figure
M <- as.matrix(read.fwf(
    file = "11grid.txt",
    sep = "",
    widths = rep(2, 30)
))
colnames(M) <- NULL
ProdDiagM <- matrix(nrow = 20,
                    ncol = 20)
ProdRight <- matrix(nrow = 20,
                    ncol = 20)
ProdLeft <- matrix(nrow = 20,
                   ncol = 20)
ProdDown <- matrix(nrow = 20,
                   ncol = 20)
ProdUp <- matrix(nrow = 20,
                 ncol = 20)
ReverseDiagonal <- matrix(nrow = 20,
                          ncol = 20)

# Find diagonal
for (i in 1:20) {
    for (j in 1:20) {
        # Check diagonal
        ProdDiagM[i, j] <- prod(diag(M[i:20, j:20])[1:4])
        # Check adjecent on the right
        ProdRight[i, j] <- tryCatch(
            expr = prod(M[i, j:(j + 3)]),
            error = function(cond) {
                NA
            }
        )
        # Check adjecent on the left
        ProdLeft[i, j] <- tryCatch(
            expr = prod(M[i, (j - 3):j]),
            error = function(cond) {
                NA
            }
        )
        # Check adjecent down
        ProdDown[i, j] <- tryCatch(
            expr = prod(M[i:(i + 3), j]),
            error = function(cond) {
                NA
            }
        )
        # Check adjecent up
        ProdUp[i, j] <- tryCatch(
            expr = prod(M[i:(i - 3), j]),
            error = function(cond) {
                NA
            }
        )
        # Reverse diagonal
        ReverseDiagonal[i, j] <- tryCatch(
            expr = prod(diag(apply(M[i:20, j:20], 2, rev))[1:4]),
            error = function(cond) {
                NA
            }
        )
        j <- j + 1
    }
    i <- i + 1
}

# Max
max(ProdDiagM, ProdRight, ProdLeft, ProdDown, ProdUp,
    ReverseDiagonal,na.rm = TRUE)
