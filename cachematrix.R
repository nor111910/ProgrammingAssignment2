## cachematrix.R
## This script consists of two funttions that computes the inverse of a
## matrix and caches it in memory. 
##
## Functions:
## makeCacheMatrix - This function creates a matrix to cache an inverse
## cacheSove - this fuction computes the inverse of a matrix cached in
##             memory by makeCacheMatrix
##

##
## Function: makeCacheMatrix
## creates a special matrix for caching inverse of a matrix
## 
## Input: x - Matrix
## Output: list of functions:
##   setMatrix   - sets the global matrix 
##   getMatrix   - shows the cached matrix
##   getInverse  - shows cached inverse matrix
##   cacheMatrix - caches marix and inverse matrix
##

makeCacheMatrix <- function(x = matrix()) {
	omx <- matrix()     # orig matrix
	mx  <- matrix()     # cached matrix
	imx <- matrix()     # cached invsered matrix
	
	setOMatrix  <- function(m) omx <<- m
	getOMatrix  <- function() omx 
	getMatrix   <- function() mx
	getInverse  <- function() imx
	cacheMatrix <- function(m) {
		mx  <<- m
		imx <<- solve(m)
	}
	
	list(setOMatrix  = setOMatrix,
	     getOMatrix  = getOMatrix,
	     getMatrix   = getMatrix,
	     getInverse  = getInverse,
	     cacheMatrix = cacheMatrix)
}

##
## Function: cacheSolve
## computes the inverse of a matrix created by makeCacheMatrix.
## if the inverse has already been cached the cache Matrix the 
## cached matrix is retrieved, else the matrix inverse is computed
## and cached.
##
## Input: x - special Matrix
## Output: inverse matrix
##

cacheSolve <- function(x,...) {
	## Return a matrix that is the inverse of 'x'

	if (identical(x$getOMatrix(),x$getMatrix()) == T) {
		message("Same Matrix. Pulling from cache.")
	} else {
		message("New Matrix. Computing and saving to cache.")
		x$cacheMatrix(x$getOMatrix())
	}
	x$getInverse()
}


####### EOf ########
