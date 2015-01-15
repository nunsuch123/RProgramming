weightmedian <- function(directory, day) {
        files_list <- list.files(directory, full.names=TRUE) # CREATE FILE LIST
        dat <- data.frame() # create empty data frame
        for (i in 1:5) {
                #loop through files and bind together into one frame
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- subset(dat, dat$Day==day) # subsets by day argument
        median(dat_subset[, "Weight"], na.rm=TRUE) #median weight without nas
}