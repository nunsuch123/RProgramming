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
        
        files_full <- list.files(directory, full.names=TRUE)[id] # full paths
        
        nobs <- numeric() # empty numeric vector to hold  values
        ids <- numeric() ##empty for ids
        
        for (i in 1:length(files_full)) {  
                
                # read in dataset
                dat <- read.csv(files_full[i])
                
                # count number of complete cases
                nobs <- c(nobs, nrow(dat[complete.cases(dat),]))
                
                # pass thru ids
                ids <- c(ids, i)

        }

        data.frame(id,nobs)
        
}