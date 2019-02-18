library(dplyr)
library(data.table)

# Read Activity, Features files and Test & Train Folders

features <- read.table("UCI HAR Dataset/features.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Test folder
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
labels_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Train Folder
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")
labels_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")


## Rename Activity labels 
colnames(activity_labels) <- c("activityId", "activityLabel")

colnames(test_set) <- features[,2] 
colnames(labels_test) <- "activityId"
colnames(subjects_test) <- "subjectId"

colnames(training_set) <- features[,2] 
colnames(labels_train) <-"activityId"
colnames(subjects_train) <- "subjectId"

# Merge the train and test sets to create one data set.
merged_test <- cbind(test_set, labels_test, subjects_test)
merged_train <- cbind(training_set, labels_train, subjects_train)

merged_test_and_train <- rbind(merged_test, merged_train)

# Use descriptive activity names to name the activities in the data set
column_names <- colnames(merged_test_and_train)

# Tidy data set with the average of each variable for each activity and each subject
mean_and_std <- (grepl("activityId" , column_names) | 
                         grepl("subjectId" , column_names) | 
                         grepl("mean.." , column_names) | 
                         grepl("std.." , column_names) )

mean_and_std2 <- merged_test_and_train[ , mean_and_std == TRUE]

mean_std_activity_labels <- merge(mean_and_std2, activity_labels, by="activityId", all.x=TRUE)

tidy_data <- aggregate(. ~activityLabel + subjectId , mean_std_activity_labels, mean)
tidy_data <- tidy_data[order(tidy_data$activityId, tidy_data$subjectId),]

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
