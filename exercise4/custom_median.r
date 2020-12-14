# Author: Nikos Kougianos
# Date: 13/12/2020

custom_median <- function(x, na.rm = FALSE) {
    # Check if vector has any NA values
    if (anyNA(x)) {
        # Check na.rm if TRUE or FALSE
        if (na.rm == TRUE) {
            # If true, remove NA values from x
            x <- x[!is.na(x)]
            
        } else {
            # If false, then return NA as result like median function
            return(NA)
            
        }
        
    }
    
    # Sort x
    x = sort(x)
    
    # Check if length of x is even or odd
    # If even, then we want to return the mean of the 2 middle elements
    # If odd, then we want to return only the middle element
    if (length(x) %% 2 == 0) {
        middle1 <- x[length(x) %/% 2]
        middle2 <- x[length(x) %/% 2 + 1]
        return(mean(c(middle1, middle2)))
    } else {
        return(x[length(x) %/% 2 + 1])
    }
    
}

# Sample executions of custom_median function, using integer vectors,
# double vectors, vectors with NA values and vectors without NA values
custom_median(runif(10, 0, 100), FALSE)
custom_median(runif(150, 0, 100), FALSE)
custom_median(sample.int(100, 9), FALSE)
custom_median(sample.int(100, 200, replace=TRUE), FALSE)
custom_median(c(NA,1,5,15.6,NA,6,7,8,9), FALSE)
custom_median(c(NA,1,5,15.6,NA,6,7,8,9), TRUE)
custom_median(c(1,5,15.6,6,7,8,9), FALSE)
