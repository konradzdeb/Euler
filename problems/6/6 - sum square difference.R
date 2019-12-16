sum(1:100) ^ 2 - sum(sapply(1:100, function(x) {
    x ^ 2
}))
