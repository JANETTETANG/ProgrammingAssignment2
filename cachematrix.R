##  Below are two functions that are used to create a special object that stores a matrix and caches its inverse matrix.

## The first function, makeVector creates a special "matrix", which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the inverse of the matrix
## get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

        m<-NULL
        set<-function(y){
          x<<-y
          m<<-NULL
        }
        get<-function()x
        setsolve<-function(solve) m<<- solve
        getsolve<-function()m
        list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)

}


## The following function calculates the mean of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse matrix from the cache and skips the computation.
## Otherwise, it calculates the inverse of matrix and sets it in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
        m<-x$getsolve()
        if(!is.null(m)){
          message("getting cached data")
          return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setsolve(m)
        m
  
  ## Return a matrix that is the inverse of 'x'
}
