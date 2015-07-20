Data_clean <- function(k)

{
        Act_names <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
        colnames(Act_names) <- c("Activity", "Descriptive")
        
        X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
        Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", quote="\"")
        Subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
        Test <- data.frame(Subjects_test, Y_test, X_test)
        
        X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
        Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", quote="\"")
        Subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
        Train <- data.frame(Subjects_train, Y_train, X_train)
        
        BASE <- rbind(Test, Train)
        
        Names <- read.table("UCI HAR Dataset/features.txt", quote="\"")
        colnames(BASE) <- c("Subjects","Activity", as.matrix(as.data.frame(Names["V2"])))
        
        keeps <- c("Subjects", "Activity", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyAccMag-meanFreq()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyAccJerkMag-meanFreq()", "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroMag-meanFreq()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()", "fBodyBodyGyroJerkMag-meanFreq()")
        
        DATA <- BASE[keeps]
        
        DATA <- merge(Act_names, DATA, by = "Activity")
        
        DATA <- summarise_each(group_by(DATA, Activity, Descriptive, Subjects), funs(mean))
        
        return(DATA)
}