# R-specialization
Repo for the projects in the coursera specialization in Data Science.

The "run-analysis.R" contains an script for the peer assesment on the Getting and Cleaning Data course in the Data Science specialization track at Coursera.

The script is divided in the same principles that were described in the assesment instructions.

- You should create one R script called run_analysis.R that does the following.

1- Merges the training and the test sets to create one data set.

      Get the activity names base and save it
        Act_names <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
        colnames(Act_names) <- c("Activity", "Descriptive")
        
      Get the TEST data and merge it with the subjects and activities for each one
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
        Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", quote="\"")
        Subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
        Test <- data.frame(Subjects_test, Y_test, X_test)
        
      Get the TRAIN data and merge it with the subjects and activities for each one
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
        Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", quote="\"")
        Subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
        Train <- data.frame(Subjects_train, Y_train, X_train)
        
      Combines the TEST and TRAIN bases and get the names off each column
        BASE <- rbind(Test, Train)
        Names <- read.table("UCI HAR Dataset/features.txt", quote="\"")
        colnames(BASE) <- c("Subjects","Activity", as.matrix(as.data.frame(Names["V2"])))

2- Extracts only the measurements on the mean and standard deviation for each measurement. 

      Get a vector with the columns that were supposed to stay (how to do this without typing all of it?) and then transforming the base to just keep these
        keeps <- c("Subjects", "Activity", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyAccMag-meanFreq()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyAccJerkMag-meanFreq()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroMag-meanFreq()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()", "fBodyBodyGyroJerkMag-meanFreq()")
        DATA <- BASE[keeps]

3- Uses descriptive activity names to name the activities in the data set

      Merge the Activity names with the base, creating the "Descriptive" column
        DATA <- merge(Act_names, DATA, by = "Activity")

4- Appropriately labels the data set with descriptive variable names.

        Done before in the first step of the code

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

      Use of the dplyr package to summarise the data in for each activity and subject
        DATA <- summarise_each(group_by(DATA, Activity, Descriptive, Subjects), funs(mean))
        return(DATA)

Thanks for reading and waiting for you comments on how could I improve my coding. Cheers!
