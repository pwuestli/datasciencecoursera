pollutantmean <- function(directory, pollutant, id = 1:332){
      values <- c()
      for(i in id){
        filepath <- paste(directory,'/', sprintf("%03d", i) ,'.csv', sep = '')
        data <- read.csv(filepath)
        values <- c(values, data[,pollutant])
      }
      mean_val <- mean(values, na.rm = TRUE)
}