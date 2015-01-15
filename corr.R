corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        files_full <- list.files(directory, full.names=TRUE) # full paths
        dat <- data.frame() # empty data frame to hold records
        nobs <- numeric() # empty numeric vector to hold  values
        for (i in id) {  
                dat <- rbind(dat, read.csv(files_full[i]))
                nobs <- c(nobs, sum(complete.cases(dat))) ## summarize and add to vector
        }
        if nobs <= threshold
}