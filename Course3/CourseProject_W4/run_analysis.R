## Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Set working directory to the folder with the unzipped data:
setwd("Git/Course3/CourseProject_W4/")

## 1. Merges the training and the test sets to create one data set.
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_comb <- rbind(train, test)

train <- read.table("UCI HAR Dataset/train/y_train.txt")
test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_comb <- rbind(train, test)

train <- read.table("UCI HAR Dataset/train/subject_train.txt")
test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_comb <- rbind(train, test)

##clear unused variables
remove(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("UCI HAR Dataset/features.txt")
## position of all features mean or std in the name and use them to subset x_comb
## Important: no spaces in the regular expression, otherwise it won't work
features_ind <- grep(".*mean.*|.*std.*", features[,2])
x_comb <- x_comb[,features_ind]
 
features_names <- grep(".*mean.*|.*std.*", features[,2], value = T )
names(x_comb) <- tolower(gsub('[-()]', '', features_names))

remove(features, features_ind, features_names)

## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- gsub("_", "", tolower(activities[, 2]))
y_comb[,1] <- as.factor(activities[y_comb[,1],2])
remove(activities)

## 4. Appropriately labels the data set with descriptive variable names.
names(y_comb) <- "activity"
names(subject_comb) <- "subject"
## Combine to single dataset
clean_ds <- cbind(subject_comb, y_comb, x_comb)
remove(subject_comb, y_comb, x_comb)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Easier with reshape package
subjects <- unique(clean_ds$subject)
activity <- unique(clean_ds$activity)
ncols <- ncol(clean_ds)
## create copy of the clean data set with fewer rows
new_ds <- clean_ds[1:(length(subjects)*length(activity)),]

## counter for rows
row = 1

for (subj in subjects) {
      for (act in activity) {
            new_ds[row,1] <- subj
            new_ds[row,2] <- act
            ## create subset with all data for given subject and activity
            subs <- clean_ds[clean_ds$subject == subj & clean_ds$activity == act, 3:ncols ]
            new_ds[row, 3:ncols] <- colMeans(subs)
            row <- row + 1
      }
}

write.table(new_ds, file = "tidy_with_avg.txt", row.names = FALSE)