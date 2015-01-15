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
        for (i in id) {  
                dat <- rbind(dat, read.csv(files_full[i]))
                nobs <- c(nobs, sum(complete.cases(dat))) ## summarize and add to vector
        }
        return(data.frame(id, nobs))
}