## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## run the following program
## > source('cachematrix.R')
## >  data <- makeCacheMatrix(matrix(c(5, 0, 0, 0, 5,0,0,0,5), c(3, 3)))
## > cacheSolve(data)


makeCacheMatrix <- function(x = matrix()) {
    element <- NULL
    setmatrix <- function(y) {
        x <<- y
        element <<- NULL
    }
    getmatrix <- function() x
    setinverse <- function(inv) element <<- inv
    getinverse <- function() element
    list(
        setmatrix = setmatrix,
        getmatrix = getmatrix,
        setinverse = setinverse,
        getinverse = getinverse
    )
}


## Calculate the inverse of the matrix 


cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$getmatrix()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}