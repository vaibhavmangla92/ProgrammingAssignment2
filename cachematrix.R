## Put comments here that give an overall description of what your
## functions do

## This function returns a list with all the nested functions as objects. set() function in used to initialise the matrix
## whose inverse has to be determined. get() function returns the matrix. setinverse sets variable i to the inverse of 
## matrix. getinverse() returs the inverse and if the inverse is computed for the first time then it returns null.

makeCacheMatrix <- function(x = matrix()) {
                i <- NULL
		set <- function(y) {
			x <<- y
			i <<- NULL
		}
		get <- function() x
		setinverse <- function(inverse) i <<- inverse
		getinverse <- function() i
		list(set = set, get = get,
			setinverse = setinverse,
			getinverse = getinverse)

}


## The following function takes the list input created by above function and calls the functions of the list via named
## argument convention. If the inverse has been already computed then the message "getting cached data" is displayed 
## alongwith inverse and exits the function.

cacheSolve <- function(x, ...) {
                i <- x$getinverse()
		if(!is.null(i)) {
			message("getting cached data")
			return(i)
		}
		data <- x$get()
		i <- solve(data, ...)
                 x$setinverse(i)
                 
         ## Return a matrix that is the inverse of 'x'
		i

      
}
