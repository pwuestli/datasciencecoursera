best <- function(state, outcome) {
      ## Read outcome data
      data <- read.csv("Git/Course2/progAssignment3/outcome-of-care-measures.csv", colClasses = "character")
      ## Check that state and outcome are valid
      outcomes <- c("heart attack", "heart failure", "pneumonia")
      states <- unique(data[,7])
      if (!(outcome %in% outcomes)) {
            stop("invalid outcome")
      } else if (!(state %in% states)) {
            stop("invalid state")
      } else {
            ## Return hospital name in that state with lowest 30-day death
            if (outcome == outcomes[1]) {
                  col_ind <- 11
            } else if (outcome == outcomes[2]) {
                  col_ind <- 17
            } else if (outcome == outcomes[3]) {
                  col_ind <- 23
            }
            data <- data[data[,7]==state,c(2,col_ind)]
            min_rows <- which(data[,2] == min(as.numeric(data[,2]), na.rm = TRUE))
            if (length(min_rows) == 1) {
                  data[min_rows,1]
            } else{
                  hosp_names <- data[min_rows, 1]
                  hosp_names <- sort(hosp_names)
                  hosp_names[1]
            }
      }
}

rankhospital <- function(state, outcome, num = "best") {
      ## Read outcome data
      data <- read.csv("Git/Course2/progAssignment3/outcome-of-care-measures.csv", colClasses = "character")
      ## Check that state and outcome are valid
      outcomes <- c("heart attack", "heart failure", "pneumonia")
      states <- unique(data[,7])
      if (!(outcome %in% outcomes)) {
            stop("invalid outcome")
      } else if (!(state %in% states)) {
            stop("invalid state")
      } else {
            ## Return hospital name in that state with lowest 30-day death
            if (outcome == outcomes[1]) {
                  col_ind <- 11
            } else if (outcome == outcomes[2]) {
                  col_ind <- 17
            } else if (outcome == outcomes[3]) {
                  col_ind <- 23
            }
            data <- data[data[,7]==state,c(2,col_ind)]
            data[,2] <- as.numeric(data[,2])
            data <- data[complete.cases(data[,2]), ]
            data <- data[order(data[,2],data[,1]), ]
            
            if (num == "best") {
                  data[1,1]
            } else if (num == "worst") {
                  data[nrow(data),1]
            } else {
                  if (num > nrow(data)) {
                        return(NA)
                  } else {
                        data[num,1]
                  }
                  
            }
      }
}

rankall <- function(outcome, num = "best") {
      ## Read outcome data
      data_orig <- read.csv("Git/Course2/progAssignment3/outcome-of-care-measures.csv", colClasses = "character")
      ## Check that state and outcome are valid
      outcomes <- c("heart attack", "heart failure", "pneumonia")
      states <- unique(data_orig[,7])
      states <- states[order(states)]
      if (!(outcome %in% outcomes)) {
            stop("invalid outcome")
      } else {
            ## Return hospital name in that state with lowest 30-day death
            if (outcome == outcomes[1]) {
                  col_ind <- 11
            } else if (outcome == outcomes[2]) {
                  col_ind <- 17
            } else if (outcome == outcomes[3]) {
                  col_ind <- 23
            }
            result <- data.frame()
            for (i in 1:length(states)) {
                  state <- states[i]
                  data <- data_orig[data_orig[,7]==state,c(2,col_ind)]
                  data[,2] <- as.numeric(data[,2])
                  data <- data[complete.cases(data[,2]), ]
                  data <- data[order(data[,2],data[,1]), ]
                  
                  result[i,1] <- state
                  
                  if (num == "best") {
                        result[i,2] <- data[1,1]
                  } else if (num == "worst") {
                        result[i,2] <- data[nrow(data),1]
                  } else {
                        if (num > nrow(data)) {
                              result[i,2] <- NA
                        } else {
                              result[i,2] <-  data[num,1]
                        }
                        
                  }
            }
      }
      names(result) <- c("state", "hospital")
      result
}
