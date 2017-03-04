library(gmp)
library(plyr)

get_all_factors <- function(n)
{
    prime_factor_tables <- lapply(
        setNames(n, n),
        function(i)
        {
            if (i == 1) return(data.frame(x = 1L, freq = 1L))
            plyr::count(as.integer(gmp::factorize(i)))
        }
    )
    lapply(
        prime_factor_tables,
        function(pft)
        {
            powers <- plyr::alply(pft, 1, function(row) row$x ^ seq.int(0L, row$freq))
            power_grid <- do.call(expand.grid, powers)
            sort(unique(apply(power_grid, 1, prod)))
        }
    )
}


# Attempt search ----------------------------------------------------------

i <- 1
tran <- i * (i + 1)/2

while (length(unlist(get_all_factors(tran))) < 500) {
    i <- i + 1
    tran <- i * (i + 1)/2
    if (i %% 1e4 == 0) {
        print(paste("i:", i))
    }
}
