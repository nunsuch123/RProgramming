corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        file.names <- list.files(path = directory, full.names=T)
        
        cr <- c()
        
        for (i in 1:length(file.names)) {
                
                data <- read.csv(file.names[i])
                data <- data[complete.cases(data),]
                id <- head(data$ID, n=1)
                
                if (nrow(data) > threshold) {
                        c <- cor(data$sulfate, data$nitrate)
                        cr <- c(cr,c)
                }
                
        }
        
        cr
        
}