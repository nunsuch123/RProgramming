complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        files_full <- list.files(directory, full.names=TRUE) # full paths
        dat <- data.frame() # empty data frame to hold records
        nobs <- numeric() # empty numeric vector to hold  values
        ids <- numeric() ##empty for ids
        result <- data.frame() ## empty data frame for result
        for (i in id) {  
                
                dat <- rbind(dat, read.csv(files_full[i]))
                #datc <- subset(dat, complete.cases(dat))
                
                nobs <- c(nobs, nrow(dat[complete.cases(dat),]))
                
                ids <- c(ids, i)
                        print(ids)
                #nobs <- c(nobs, nrow(datc))    
                        print(nobs)
                result <- data.frame(id=ids, nobs=nobs)
        }
        #result <- rbind(result , data.frame(id = ids, nobs = nobs))
        #result <- data.frame(id=ids, nobs=nobs)
        
        #return(data.frame(id, nobs))
        return(result)
}