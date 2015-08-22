##Assignment 3 : Caching the Inverse of a Matrix

## Write a short comment describing this function

#This metrhod creates special "Matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(mean) m <<- mean
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}

#If X is a square invertible matrix,  then solve(X)  returns its inverse



#This function computes the inverse of the special matrix returned by 
#makeCacheMatrix function. If the inverse has already been calculated 
#then the cachesolve would retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  m

}
