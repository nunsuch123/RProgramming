rankall <- function(outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name

        # read outcome data
        ds <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        ds[, 11] <- as.numeric(ds[, 11]) # heart attack
        ds[, 17] <- as.numeric(ds[, 17]) # heart failure
        ds[, 23] <- as.numeric(ds[, 23]) # pneumonia
        
        #unique states;
        unique_states = unique(ds[, 7])
        
        # check validity of outcome
        outc <- switch(outcome, "heart attack"=11, "heart failure"=17, "pneumonia"=23, 0)
        if (outc == 0) stop("invalid outcome")

        # subset table
        ds = ds[, c(2, 7, outc)]
        ds = na.omit(ds)
        
        #rank the subset dataset (outcome and state)
        staterank <- function(state) {
                df = ds[ds[, 2] == state, ]
                nrowhosp = nrow(df)

                # manage ranking
                switch(num, best = {
                        num = 1
                }, worst = {
                        num = nrowhosp
                })
                if (num > nrowhosp) {
                        result = NA
                }
                
                ord = order(df[, 3], df[, 1])
                state_result = df[ord, ][num, 1]
                c(state_result, state)
        }
        
  out = do.call(rbind, lapply(unique_states, staterank))
  out = out[order(out[, 2]), ]
  rownames(out) = out[, 2]
  colnames(out) = c("hospital", "state")
  data.frame(out)
        
}