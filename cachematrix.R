##still a little confused....
## but getting hands-on like this is really good

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y){
               x <<- y        
        }
        get <- function() x
        setinverse <- function(solve) inverse <<- solve
        getinverse <- function() inverse
        list( set=set, get=get, setinverse=setinverse, getinverse=getinverse )
}

cacheSolve <- function(x, ...) {
        inverse <- x$getinverse()
        if(!is.null(inverse)){
                message("getting the cached value")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data,...)
        x$setinverse(inverse)
        inverse
}
