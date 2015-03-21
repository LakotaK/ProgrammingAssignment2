## Functions will cache the inverse of a matrix


## Creates a special "matrix" object that can cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<-y
    m <<-NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(set = set, get = get, 
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## Computes the inverse of the special "matrix" returned
## by the function above. 

cacheSolve <- function(x = matrix, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix <- x$get()
  m <- solve(matrix, ...)
  x$setmatrix(m)
  m
}
