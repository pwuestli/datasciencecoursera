corr <- function(directory, threshold = 0){
      corr <- c()
      compl <- complete(directory)
      for(i in 1:nrow(compl)){
            if(compl[[i,2]] > threshold){
                  filepath <- paste(directory,'/', sprintf("%03d", i) ,'.csv', sep = '')
                  data <- read.csv(filepath)
                  complcases <- data[complete.cases(data), ]
                  corr <- c(corr, cor(x = complcases$nitrate, y = complcases$sulfate ))
            }
      }
      corr
}