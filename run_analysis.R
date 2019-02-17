library(dplyr)


# read training data
train_subjects <- read.table("subject_train.txt")
train_values <- read.table("X_train.txt")
train_activity <- read.table("y_train.txt")

# read test data
test_subjects <- read.table("subject_test.txt")
test_values <- read.table("X_test.txt")
test_activity <- read.table("y_test.txt"))

# read features without convertin of text labels in to factors
features <- read.table("features.txt")

# read activity labels
activities <- read.table("activity_labels.txt")
colnames(activities) <- c("Id", "Label")

### *** 1. Merge the training and the test sets to create one data set *** ###

# create single data table
Activity <- rbind(cbind(train_subjects, train_values, train_activity),cbind(test_subjects, test_values, test_activity))

# remove single data tables in order to save memory
rm(train_subjects, train_values, train_activity, test_subjects, test_values, test_activity)

# give column names
colnames(Activity) <- c("subject", features[, 2], "activity")

### *** 2. Extract only the measurements on the mean and standard deviation for each measurement *** ###

# select only the varibels, which we need according to their columns names
Activity <- Activity[, grepl("subject|activity|mean|std", colnames(Activity))]

### *** 3. Use descriptive activity names to name the activities in the data set *** ###

Activity <- mutate(Activity,activity=factor(activity,levels = activities[,1],labels = activities[,2]))

### *** 4. Appropriately label the data set with descriptive variable names *** ###

# get column names
Activity_col <- colnames(Activity)

# remove special characters, clead the names and correct the type
Activity_col <- gsub("[\\(\\)-]", "", Activity_col)
Activity_col <- gsub("^f", "frequencyDomain", Activity_col)
Activity_col <- gsub("^t", "timeDomain", Activity_col)
Activity_col <- gsub("Acc", "Accelerometer", Activity_col)
Activity_col <- gsub("Gyro", "Gyroscope", Activity_col)
Activity_col <- gsub("Mag", "Magnitude", Activity_col)
Activity_col <- gsub("Freq", "Frequency", Activity_col)
Activity_col <- gsub("mean", "Mean", Activity_col)
Activity_col <- gsub("std", "StandardDeviation", Activity_col)
Activity_col <- gsub("BodyBody", "Body", Activity_col)

# replace the col-names with the new one
colnames(Activity) <- Activity_col

### *** Step 5. Create a second, independent tidy set with the average of each 
#          variable for each activity and each subject *** ####

# group by subject and activity and summarise using mean
Activity_means <- Activity %>% group_by(subject, activity) %>% summarise_all(funs(mean))

# output to file "tidy_data.txt"
write.table(Activity_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)
