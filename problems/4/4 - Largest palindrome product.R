
# Matrix approach ---------------------------------------------------------

Mat <- 1:999 %o% 1:999
MatPalTF <- apply(
    Mat,
    c(1, 2),
    FUN = function(x) {
        productSplit <- unlist(strsplit(as.character(x), ""))
        leftSide <- productSplit[1:(length(productSplit) / 2)]
        rightSide <-
            rev(productSplit[(length(productSplit) / 2 + 1):length(productSplit)])
        all(leftSide == rightSide)
    }
)

MatRes <- Mat[MatPalTF]

max(MatRes)
