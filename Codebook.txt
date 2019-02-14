For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##List of Files

The raw dataset included the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

## A group of 30 volunteers carried out the experiment doing activities

The six activities that each person performed

1.WALKING
2.WALKING_UPSTAIRS
3.WALKING_DOWNSTAIRS
4.SITTING
5.STANDING
6.LAYING


###Measurements include: 

 [1] "tBodyAcc-mean()-X"                    "tBodyAcc-mean()-Y"                    "tBodyAcc-mean()-Z"                    "tGravityAcc-mean()-X"                 "tGravityAcc-mean()-Y"                
 [6] "tGravityAcc-mean()-Z"                 "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"                "tBodyAccJerk-mean()-Z"                "tBodyGyro-mean()-X"                  
[11] "tBodyGyro-mean()-Y"                   "tBodyGyro-mean()-Z"                   "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"               "tBodyGyroJerk-mean()-Z"              
[16] "tBodyAccMag-mean()"                   "tGravityAccMag-mean()"                "tBodyAccJerkMag-mean()"               "tBodyGyroMag-mean()"                  "tBodyGyroJerkMag-mean()"             
[21] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                    "fBodyAcc-mean()-Z"                    "fBodyAcc-meanFreq()-X"                "fBodyAcc-meanFreq()-Y"               
[26] "fBodyAcc-meanFreq()-Z"                "fBodyAccJerk-mean()-X"                "fBodyAccJerk-mean()-Y"                "fBodyAccJerk-mean()-Z"                "fBodyAccJerk-meanFreq()-X"           
[31] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"            "fBodyGyro-mean()-X"                   "fBodyGyro-mean()-Y"                   "fBodyGyro-mean()-Z"                  
[36] "fBodyGyro-meanFreq()-X"               "fBodyGyro-meanFreq()-Y"               "fBodyGyro-meanFreq()-Z"               "fBodyAccMag-mean()"                   "fBodyAccMag-meanFreq()"              
[41] "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-meanFreq()"       "fBodyBodyGyroMag-mean()"              "fBodyBodyGyroMag-meanFreq()"          "fBodyBodyGyroJerkMag-mean()"         
[46] "fBodyBodyGyroJerkMag-meanFreq()"      "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"     "angle(tBodyGyroJerkMean,gravityMean)"
[51] "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                 "angle(Z,gravityMean)"                 "tBodyAcc-std()-X"                     "tBodyAcc-std()-Y"                    
[56] "tBodyAcc-std()-Z"                     "tGravityAcc-std()-X"                  "tGravityAcc-std()-Y"                  "tGravityAcc-std()-Z"                  "tBodyAccJerk-std()-X"                
[61] "tBodyAccJerk-std()-Y"                 "tBodyAccJerk-std()-Z"                 "tBodyGyro-std()-X"                    "tBodyGyro-std()-Y"                    "tBodyGyro-std()-Z"                   
[66] "tBodyGyroJerk-std()-X"                "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"                "tBodyAccMag-std()"                    "tGravityAccMag-std()"                
[71] "tBodyAccJerkMag-std()"                "tBodyGyroMag-std()"                   "tBodyGyroJerkMag-std()"               "fBodyAcc-std()-X"                     "fBodyAcc-std()-Y"                    
[76] "fBodyAcc-std()-Z"                     "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                 "fBodyAccJerk-std()-Z"                 "fBodyGyro-std()-X"                   
[81] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                    "fBodyAccMag-std()"                    "fBodyBodyAccJerkMag-std()"            "fBodyBodyGyroMag-std()"              
[86] "fBodyBodyGyroJerkMag-std()" 

##Data Cleaning
1. merge training and testing sets
2. Extract fields containing data related to means and standard deviations 
3. Add descriptive activity labels
4. Create new dataset where rows are the average measurement for each field, for each subject and for each activity type
