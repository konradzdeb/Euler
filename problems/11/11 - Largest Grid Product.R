# Notes -------------------------------------------------------------------

# Problem 11

# Data --------------------------------------------------------------------

# Read provided matrix
M <-
    matrix(
        data = scan("./problems/11/11grid.txt"),
        nrow = 20,
        ncol = 20
    )

# Support -----------------------------------------------------------------

# Pad matrix for the desired number of neighbhours
pad_matrix <- function(M, n = 4) {
    # Create a list of NAs to pad
    l <- lapply(X = 1:n, function(x) {
        NA
    })
    # Pad columns
    lc <- l
    lc[[1]] <- M
    Mcols <- do.call(what = cbind, args = lc)
    Mcols <- do.call(what = cbind, args = {
        # Pad other side
        lc[[1]] <- Mcols
        rev(lc)
    })
    # Pad rows
    lr <- l
    lr[[1]] <- Mcols
    Mcols_rows <- do.call(what = rbind, args = lr)
    Mcols_rows <- do.call(what = rbind, args = {
        # Pad other side
        lr[[1]] <- Mcols
        rev(lr)
    })
    Mcols_rows
}


# Search ------------------------------------------------------------------

search_product <- function(M = M, n = 4) {
    addresses <- expand.grid(x = sequence(nrow(M)),
                             y = sequence(ncol(M)))
    n_search <- n - 1

    # Create padded matrx
    M_pad <- pad_matrix(M = M, n = 4)


    neighbhours_res <- apply(
        X = addresses,
        MARGIN = 1,
        FUN = function(M_addr) {
            tryCatch(
                expr = list(
                    North = M_pad[M_addr["x"]:(M_addr["x"] - n_search), M_addr["y"]],
                    North_East = c(M_pad[M_addr["x"], M_addr["y"]], sapply(
                        X = 1:n_search,
                        FUN = function(i) {
                            M_pad[M_addr["x"] - i,
                                  M_addr["y"] + i]
                        }
                    )),
                    East = M_pad[M_addr["x"], M_addr["y"]:(M_addr["y"] + n_search)],
                    South_East = c(M_pad[M_addr["x"], M_addr["y"]], sapply(
                        X = 1:n_search,
                        FUN = function(i) {
                            M_pad[M_addr["x"] + i,
                                  M_addr["y"] + i]
                        }
                    )),
                    South = M_pad[M_addr["x"]:(M_addr["x"] + n_search), M_addr["y"]],
                    South_West = c(M_pad[M_addr["x"], M_addr["y"]], sapply(
                        X = 1:n_search,
                        FUN = function(i) {
                            M_pad[M_addr["x"] + i,
                                  M_addr["y"] - i]
                        }
                    )),
                    West = M_pad[M_addr["x"], M_addr["y"]:(M_addr["y"] - n_search)],
                    North_West = c(M_pad[M_addr["x"], M_addr["y"]], sapply(
                        X = 1:n_search,
                        FUN = function(i) {
                            M_pad[M_addr["x"] - i,
                                  M_addr["y"] - i]
                        }
                    ))
                ),
                error = function(e) {
                    NA
                }
            )
        }
    )
    products <-
        rapply(object = neighbhours_res,
               f = prod,
               classes = "numeric")
    # Keep max only
    max(products, na.rm = TRUE)
}
res <- search_product(M = M, n = 4)
res
