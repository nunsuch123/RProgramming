rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with the given rank
        ## 30-day death rate

        # read outcome data
        ds <- read.csv("outcome-of-care-measures.csv", colClasses="character")
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

        df = ds[ds$State == state, c(2, outc)]
        df = na.omit(df)
        #rank the subset dataset (outcome and state)
        nrowhosp = nrow(df)

        # manage ranking
        if (num=="best") {
                r <- 1
        } else if (num =="worst") {
                r <- nrowhosp
        } else if (num <= nrowhosp ) {
                r <- num
        } else {
                return(NA)
        }
        
        #print(a)
        #print(b)
        #print(r)
        
        #return(df$Hospital.Name[order(rankdf, df$Hospital.Name)[r]])
        ord <- order(df[, 2], df[, 1])
        df[ord, ][r, 1]
        
}