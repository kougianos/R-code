# Author: Nikos Kougianos
# Date: 4/12/2020


calculateW2 <- function(x) {
    # We call mean and sd functions outside of loop for performance reasons
    mean <- mean(x)
    s <- sd(x)
    
    result <- c()
    
    tmp <- 0
    
    # Loop vector
    for (i in 1:length(x)) {
        if (abs((i - mean) / s) < 1) {
            tmp = 1
        } else if (abs((i - mean) / s) >= 1 &
                   abs((i - mean) / s) < 2) {
            tmp = 0.5
        } else {
            tmp = 0
        }
        result <- append(result, tmp)
    }
    
    return(result)
    
}

calculateW3 <- function(x) {
    mean <- mean(x)
    s <- sd(x)
    
    tmp = 1 / (s * sqrt(2 * pi))
    result = tmp * exp((-1 / (2 * s ** 2)) * ((x - mean) ** 2))
    
    return(result)
    
}


# This function is the solution of the exercise
f <- function(x) {
    # Initialize object to return
    result <- c()
    
    # Calculate w1
    result[[1]] <- rep(1, length(x))
    # Calculate w2
    result[[2]] <- calculateW2(x)
    # Calculate w3
    result[[3]] <- calculateW3(x)
    return(result)
}


# Call function f with a vector with values from 1 to 50
f(1:50)
