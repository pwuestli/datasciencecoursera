complete <- function(directory, id = 1:332){
      lid <- length(id)
      dataframe <- data.frame( id = numeric(lid), nobs = numeric(lid) )
      for(i in 1:lid){
            filepath <- paste(directory,'/', sprintf("%03d", id[i]) ,'.csv', sep = '')
            data <- read.csv(filepath)
            dataframe$id[i] = id[i]
            dataframe$nobs[i] = sum(complete.cases(data))
      }
      dataframe
}