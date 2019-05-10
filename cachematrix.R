## Put comments here that give an overall description of what your
## functions do
# first function  caches a matrix and inverse it using solve
# and the second applies the inverse if not already done
## Write a short comment describing this function
#cache a matrix based on input
#lintagliata 5/10/2019
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) m <<- solve
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}


## Write a short comment describing this function
# this takes the cached matrix (checking first to see if it exists) then inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached matrix")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setmatrix(m)
        m
}
