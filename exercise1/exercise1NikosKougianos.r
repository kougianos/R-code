func1 <- function(x) {
    
    result <- c()
    
    for(i in 1:length(x)) {

        result<-append(result, x[i]**i)
    }
    return(result)
    
}

func2 <- function(x) {
    
    result <- c()
    
    for(i in 1:length(x)) {
        
        result<-append(result, (x[i]**i)/i)
    }
    return(result)
    
}

func3 <- function(x, n) {
    
    if(n<=0) {
        return("n must be a positive number")
    }
    
    result = 1
    
    for(i in 1:n) {
        result = result + (x**i)/i
    }
    
    return(result)
    
}

l = func1(c(2,3,4,5,7,9))

func2(c(4,3,5,2))

func3(3,3)





