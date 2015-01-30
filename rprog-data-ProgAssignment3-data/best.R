 best <- function(state, outcome) {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        # read outcome data
        ds <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        # change outcome columns to numeric - there will be warnings
        ds[, 11] <- as.numeric(ds[, 11]) # heart attack
        ds[, 17] <- as.numeric(ds[, 17]) # heart failure
        ds[, 23] <- as.numeric(ds[, 23]) # pneumonia
        
        # check validity of state
        if (!state %in% unique(ds[, 7])) {
                stop("invalid state")
        }
        
        # check validity of outcome
        outc <- switch(outcome, "heart attack"=11, "heart failure"=17, "pneumonia"=23, 0)
        if (outc == 0) stop("invalid outcome")

        # pull best outcome by state
        df = ds[ds$State == state, c(2, outc)]
        df[which.min(df[, 2]), 1]
        
        
}