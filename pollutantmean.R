pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        # do i need to do anything here?
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
  
        files_full <- list.files(directory, full.names=TRUE) # full paths
        dat <- data.frame() # empty data frame
        rslt <- numeric() # empty numeric vector to hold subset values
        for (i in id) {  
                dat <- rbind(dat, read.csv(files_full[i]))
        } #read in files and bind together
        
        ##y <- subset(dat, !is.na(pollutant) & ID==id, pollutant) ##subset non na pollutants
        # doesn't work - it's a data frame and can't call the column
        # try a numeric vector
        rslt = c(rslt, dat[[pollutant]])
        
        return(mean(rslt, na.rm = TRUE)) #calc mean without nas  
}
