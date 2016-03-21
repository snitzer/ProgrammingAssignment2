## Brian Snitzer
## March 21, 2016
## Programing assignment 2 for Coursera data science

## Taken from the README.md example and changed from mean to inverse
## The first function, `makeVector` creates a special "vector", which is
## really a list containing a function to

## 1.  set the value of the vector
## 2.  get the value of the vector
## 3.  set the value of the inverse
## 4.  get the value of the invere

makeCacheMatrix <- function(x = matrix()) {

        inv <- NULL
        #Set the value of the vector
        set <- function(y) {
        x <<- y
        inv <<- NULL
        }
        #Get the value of the vector
        get <- function() x
        
        #set the value of the inverse
        setinverse <- function(inverse) inv <<- inverse
        #get the value of the inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
    
}


## Also Taken from the README.md example and changed from mean to inverse
## The following function calculates the inverse of the special "vector"
## created with the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setinverse`
#  function.


cacheSolve <- function(x, ...) {
        ## First check and see if the inverse is already there
        ## if so, return the existing result
        inv <- x$getinverse()
        if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
        }
        ## If not, then go ahead and solve the inverse
        data <- x$get()
        inv <- solve(data,...)
        x$setinverse(inv)
        inv
}
