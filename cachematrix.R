## Put comments here that give an overall description of what your
## functions do

## The following functions calculate the inverse of a matrix and saves it 
## to the cache such that the next time the user attempts to calculate the  
## matrix inverse, the previously saved value is returned instead of 
## repeating the calculation. 

## Write a short comment describing this function
## This function creates a special "matrix" object, which is really a list  
## containing a function to 
## 1. set the value of the matrix 
## 2. get the value of the matrix 
## 3. set the value of the inverse 
## 4. get the value of the inverse 


makeCacheMatrix <- function(x = matrix()) {
  ## create a matrix object x and some associated sub-functions/methods 
         
        ## define the cache m so m receives a NULL value
        m <- NULL 
       set <- function(y) { 
         x <<- y ## assign the input matrix y to the variable x in the 
              ## parent environment 
              m <<- NULL ## re-initialize m in the parent environment to null 
     } 
     get <- function() x ## return the matrix x 
     setinverse <- function(inverse) m <<- inverse ## set the cache m equal 
     ## to the inverse of the matrix x 
     getinverse <- function() m ## return the cached inverse of x 
     list(set = set, get = get, 
          setinverse = setinverse, 
          getinverse = getinverse) 
} 


## Write a short comment describing this function
## The following function calculates the inverse of the special "matrix" created 
## with the above function. However, it first checks to see if the inverse 
## has already been caclulated. If so, it 'get's the inverse from the cache 
## and skips the computation. Otherwise, it calculates the matrix inverse 
## and sets the value of the inverse in the cache via the 'setinverse' function 


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## First, it checks if the "matrix" has already a value  
        ## for its inverse matrix 
        m <- x$getinverse() 
        
        ## If yes, it just returns its cached value. 
       if(!is.null(m)) {
         message("getting cached data") 
         return(m) 
        } 
        data <- x$get() 
        ## If no, it computes its inverse matrix
        m <- solve(data, ...) 
        ## And then stores the inverse matrix in cache
        x$setinverse(m) 
        m 
}
