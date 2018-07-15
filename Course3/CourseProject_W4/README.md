## Coursera Data Science Specialization: Course3 Getting and Cleaning Data - Course Project

This folder contains all the necessary files and the result for the "Getting and Cleaning Data" course project.The aim of this project is to take data collected from accelerometers from the Samsung Galaxy S smartphone and create a tidied up data set.
* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Content
Inside this repo you will find all data necessary to reproduce the result of this course project.
* The folder UCI HAR Dataset cointains all the raw datafiles with are inside of the zip-file above.
* "tidy_with_avg.txt" contains the result data set with the average value of each measurement for each subject and activity
* "run_analysis.R" contains the R script to get the tidied up data set
* "CodeBook.md"

### run_analysis.R
To use the script you'll need to download and unpack the data source. Afterwards you'll have to change the working directory in the R-script to the folder with the raw data, Laslty run the script and it will produce a single tidy dataset.

In detail the R-script does the following:
1. Read and combine all the training and test data
2. Extract only the measurements for mean and standard deviation, set column headers accodingly
3. Change the activity names to more descriptive ones
4. Add the rest of the labels and combine the data into a single data set
5. Create a second data set with the average of each variable for each activity and subject, save this data set into a file