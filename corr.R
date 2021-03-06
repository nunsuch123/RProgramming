corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        #initialize

        ids <- c() ##empty for ids
        cs <- c() # empty for correlation

        #pull in list of files
        files_full <- list.files(directory, full.names=TRUE) # full paths
        
        for (i in 1:length(files_full)) {  
                
                # read in dataset
                dat <- read.csv(files_full[i])
                
                # subset complete cases
                data <- dat[complete.cases(dat),]
                
                # pass thru ids
                ids <- c(ids, i)
                
                # compare thresholds
                if (nrow(data) > threshold) {
                        c <- cor(data$sulfate, data$nitrate)
                        cs <- c(cs,c)
                        
                }
                
        }
        
        cs
        
}