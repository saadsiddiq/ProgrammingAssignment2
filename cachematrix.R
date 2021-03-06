## The code below contains two functions. The first function
## creates a spcial 'matrix' object and stores its inverse. 
## The second function computes the inverse of the special matrix
## generated by the first function. If the inverse has already been 
## computed then the value is returned from cache. 

## This function creates a 'matrix'
## object and can store its inverse

makeCacheMatrix <- function(x = matrix()) {
	  inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function returns the inverse of the special 'matrix' created
## by the function above

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("retreived from cache...")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
