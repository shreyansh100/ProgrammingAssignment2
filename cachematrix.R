##still a little confused....
## but getting hands-on like this is really good

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL       ##setting the iverse to be null-- initially  
        set <- function(y){   ##setting the value of a matrix
               x <<- y          
               inverse <- NULL
        }
        get <- function() x    ##getting the value of a matrix
        setinverse <- function(solve) inverse <<- solve    ##setting the inverse of a matrix
        getinverse <- function() inverse                   ##getting the inverse of a matrix
        list( set=set, get=get, setinverse=setinverse, getinverse=getinverse )   ##showing the results in the list form to get the details 
}                                                                                ##compactly and also to know in which environment each object is

cacheSolve <- function(x, ...) {                       ##function for caching the inverse value of a matrix that was defined in above function.
        inverse <- x$getinverse()                      ##get the inverse matrix and then check whether there is any, 
        if(!is.null(inverse)){                         ##if it is present, then tke the cached value and skip rest of the computation.
                message("getting the cached value")
                return(inverse)
        }
        data <- x$get()                                 ##if cached value not present, then get the inverse of a matrix 
        inverse <- solve(data,...)                      ##and then return the inversed value
        x$setinverse(inverse)
        inverse
}
