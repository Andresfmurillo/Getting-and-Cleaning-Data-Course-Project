## Files in this repo

README.md 

CodeBook.txt -- codebook describing variables, the data and transformations

run_analysis.R --  R code


## About this Data Set

The Original Data source is downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# Codebook #

There is a total of columns and 180 rows in this dataset. Each row contains the data for one activity for one person.
The data contains 30 subjects with each subject being measured for 6 activities.

# Identifiers in the dataset#
  1. subject = THe id of the subject that was tested.
  2. activitylabel = One of 6 acitvites that recordings were taken from and includes: 'WALKING', "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" OR "LAYING".

# The dataset includes the following variables#

Variable names are stated in the columns with each column giving the data for a variable that was measured.

-Columns ending in mean() give the mean of that acitvity for the subject.
-Columns ending in std() give the standard deviation of that acitvity for the subject.
-Equipment used to obtain the data is specified in the middle of the name where 'Acc' refers to the accelerometer and 'Gyro' refers to the gyroscope. 
 
Variables included: 
1.activitylabel 
2.subject 
3.tBodyAcc-mean()-X
4.tBodyAcc-mean()-Y 
5.tBodyAcc-mean()-Z 
6.tBodyAcc-std()-X 
7.tBodyAcc-std()-Y 
8.tBodyAcc-std()-Z 
9.tGravityAcc-mean()-X 
10.tGravityAcc-mean()-Y 
11.tGravityAcc-mean()-Z 
12.tGravityAcc-std()-X 
13.tGravityAcc-std()-Y 
14.tGravityAcc-std()-Z 
15.tBodyAccJerk-mean()-X 
16.tBodyAccJerk-mean()-Y
17.tBodyAccJerk-mean()-Z 
18.tBodyAccJerk-std()-X
19.tBodyAccJerk-std()-Y
20.tBodyAccJerk-std()-Z
21.tBodyGyro-mean()-X
22.tBodyGyro-mean()-Y
23.tBodyGyro-mean()-Z 
24.tBodyGyro-std()-X 
25.tBodyGyro-std()-Y 
26.tBodyGyro-std()-Z 
27.tBodyGyroJerk-mean()-X 
28.tBodyGyroJerk-mean()-Y
29.tBodyGyroJerk-mean()-Z
30.tBodyGyroJerk-std()-X 
31.tBodyGyroJerk-std()-Y 
32.tBodyGyroJerk-std()-Z
33.tBodyAccMag-mean()
34.tBodyAccMag-std() 
35.tGravityAccMag-mean() 
36.tGravityAccMag-std() 
37.tBodyAccJerkMag-mean()
38.tBodyAccJerkMag-std()
39.tBodyGyroMag-mean()
40.tBodyGyroMag-std()
41.tBodyGyroJerkMag-mean()
42.tBodyGyroJerkMag-std()
43.fBodyAcc-mean()-X 
44.fBodyAcc-mean()-Y 
45.fBodyAcc-mean()-Z
46.fBodyAcc-std()-X
47.fBodyAcc-std()-Y 
48.fBodyAcc-std()-Z
49.fBodyAccJerk-mean()-X 
50.fBodyAccJerk-mean()-Y 
51.fBodyAccJerk-mean()-Z 
52.fBodyAccJerk-std()-X 
53.fBodyAccJerk-std()-Y
54.fBodyAccJerk-std()-Z
55.fBodyGyro-mean()-X 
56.fBodyGyro-mean()-Y 
57.fBodyGyro-mean()-Z
58.fBodyGyro-std()-X
59.fBodyGyro-std()-Y
60.fBodyGyro-std()-Z 
61.fBodyAccMag-mean()
62.fBodyAccMag-std()
63.fBodyBodyAccJerkMag-mean()
64.fBodyBodyAccJerkMag-std() 
65.fBodyBodyGyroMag-mean() 
66.fBodyBodyGyroMag-std()
67.fBodyBodyGyroJerkMag-mean() 
68.fBodyBodyGyroJerkMag-std()

## R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
