# 1. Set Working Directory & Download Zip file containing the data that will be processed
setwd("~/Documents/data")
data_download <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data_assignment4.zip", method = "curl")
## Unzip the downloaded file in the working directory

# 2. Call the package Dplyr to be used for this data set
library(dplyr)

# 3. Read Activity, Features files and Test & Train Folders
## 3.1 Features.txt file
features <- read.table("UCI HAR Dataset/features.txt", header = F)

## 3.2 Activity labels file
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = F)

## 3.3 Test folder
test_set <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
labels_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## 3.4 Train Folder
training_set <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
labels_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# 4. Rename Columns
## 4.1 rename columns in train & test sets
names(test_set) <- features$V2
names(training_set) <- features$V2

## 4.2 rename columns in activities in train & test sets
names(labels_test) <- "activities"
names(labels_train) <- "activities"

## 4.3 rename column in subject in train & test sets
names(subjects_test) <- "subject"
names(subjects_train) <- "subject"

## 4.4 add subject and activities sets to test & trian set
subject_activties_testset = cbind(subjects_test,labels_test,test_set)
subject_activties_trainset = cbind(subjects_train,labels_train,training_set)

# 5. Merge the train and test sets to create one data set.
merged_data <- rbind(subject_activties_testset, subject_activties_trainset)
merged_data2 <- merged_data[, !duplicated(colnames(merged_data))]

# 6. Extract only the measurements on the mean and standard deviation for each measurement.
mean_and_std <- merged_data2 %>% select(matches('mean|std'))

# 7. Use descriptive activity names to name the activities in the data set
descriptive_activies <- merged_data2 %>% 
        arrange(activities) %>% 
        mutate(activities = as.character(factor(activities, levels = 1:6, labels = activity_labels$V2)))

# 8. Appropriately label the data set with descriptive variable names.
names(descriptive_activies)<-gsub("tBodyAcc-","Body acceleration signal",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyAccMag-","Body acceleration signal Magnitude",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyAccJerk-","Body acceleration Jerk signal",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyAccJerkMag-","Body acceleration Jerk signal Magnitude",names(descriptive_activies))
names(descriptive_activies)<-gsub("tGravityAcc-","Gravity acceleration signal",names(descriptive_activies))
names(descriptive_activies)<-gsub("tGravityAccMag-","Gravity acceleration signal Magnitude",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyGyro-","Body acceleration of the gyroscope",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyGyroMag-","Body acceleration of the gyroscope Magnitude",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyGyroJerk-","Body acceleration Jerk signal of the gyroscope",names(descriptive_activies))
names(descriptive_activies)<-gsub("tBodyGyroJerkMag-","Body acceleration Jerk signal Magnitude of the gyroscope",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyAcc-","Body acceleration frequence",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyAccMag-","Body acceleration Magnitude",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyAccJerk-","Body acceleration jerk signal frequence",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyGyro-","Body acceleration frequence of the gyroscope",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyAccJerkMag-","Body acceleration Jerk signal frequence Magnitude of the accelerometer",names(descriptive_activies))
names(descriptive_activies)<-gsub("fBodyGyroMag-","Body acceleration frequence Magnitude of the gyroscope",names(descriptive_activies))
names(descriptive_activies)<-gsub("mean()", "MEAN", names(descriptive_activies))
names(descriptive_activies)<-gsub("std()", "Standard deviation", names(descriptive_activies))

# 9. Tidy data set with the average of each variable for each activity and each subject
tidy_data_set <- descriptive_activies %>% group_by(subject,activities) %>% summarise_all(mean)
write.table(tidy_data_set, "tidy_data.txt", row.names = F)
