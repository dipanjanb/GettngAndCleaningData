subject_train <- read.csv("subject_train.txt", sep="", header=FALSE)
label_train <- read.csv("y_train.txt", sep="", header=FALSE)
data_train <- read.csv("X_train.txt", sep="", header=FALSE)
sub1 <- data_train[,c(1:6,41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 530:531, 542:543)]
combined_train <- cbind(subject_train, label_train, sub1)

subject_test <- read.csv("subject_test.txt", sep="", header=FALSE)
label_test <- read.csv("y_test.txt", sep="", header=FALSE)
data_test <- read.csv("X_test.txt", sep="", header=FALSE)
sub2 <- data_test[,c(1:6,41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 530:531, 542:543)]
combined_test <- cbind(subject_test, label_test, sub2)

combined <- rbind(combined_train, combined_test)

colnames(combined) <- c("subject_id","activity_id", 
                        "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
                        "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", 
                        "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", 
                        "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", 
                        "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                        "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                        "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", 
                        "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z",
                        "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
                        "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z",
                        "tBodyAccMag-mean()", "tBodyAccMag-std()", 
                        "tGravityAccMag-mean()", "tGravityAccMag-std()", 
                        "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", 
                        "tBodyGyroMag-mean()", "tBodyGyroMag-std()", 
                        "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
                        "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
                        "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z",
                        "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", 
                        "fBodyAccJerk-std()-X",  "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", 
                        "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", 
                        "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", 
                        "fBodyAccMag-mean()", "fBodyAccMag-std()", 
                        "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", 
                        "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", 
                        "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")

unique_subject_activity_combinations <- unique(combined[,c(1:2)])

count <- nrow(unique_subject_activity_combinations)

for (i in 1:count){
        df1 <- combined[which((combined[,1]==unique_subject_activity_combinations[i,1]) & 
                              (combined[,2]==unique_subject_activity_combinations[i,2])),]

        for (j in 3:68) {
                if (j==3){
                        df2 <- mean(df1[,j])                
                } else {
                        df2 <- cbind(df2,mean(df1[,j]))
                }                       
                      
        }
        df3 <- cbind(unique_subject_activity_combinations[i,1],unique_subject_activity_combinations[i,2],df2)
        
        if (i==1){
                final_data <- df3
        } else {
                final_data <- rbind(final_data, df3)
        }
}

colnames(final_data) <- c("subject_id","activity_id", 
                        "AVG_tBodyAcc-mean()-X", "AVG_tBodyAcc-mean()-Y", "AVG_tBodyAcc-mean()-Z", 
                        "AVG_tBodyAcc-std()-X", "AVG_tBodyAcc-std()-Y", "AVG_tBodyAcc-std()-Z", 
                        "AVG_tGravityAcc-mean()-X", "AVG_tGravityAcc-mean()-Y", "AVG_tGravityAcc-mean()-Z", 
                        "AVG_tGravityAcc-std()-X", "AVG_tGravityAcc-std()-Y", "AVG_tGravityAcc-std()-Z", 
                        "AVG_tBodyAccJerk-mean()-X", "AVG_tBodyAccJerk-mean()-Y", "AVG_tBodyAccJerk-mean()-Z", 
                        "AVG_tBodyAccJerk-std()-X", "AVG_tBodyAccJerk-std()-Y","AVG_tBodyAccJerk-std()-Z",
                        "AVG_tBodyGyro-mean()-X", "AVG_tBodyGyro-mean()-Y", "AVG_tBodyGyro-mean()-Z", 
                        "AVG_tBodyGyro-std()-X", "AVG_tBodyGyro-std()-Y", "AVG_tBodyGyro-std()-Z",
                        "AVG_tBodyGyroJerk-mean()-X", "AVG_tBodyGyroJerk-mean()-Y", "AVG_tBodyGyroJerk-mean()-Z", 
                        "AVG_tBodyGyroJerk-std()-X", "AVG_tBodyGyroJerk-std()-Y","AVG_tBodyGyroJerk-std()-Z",
                        "AVG_tBodyAccMag-mean()", "AVG_tBodyAccMag-std()", 
                        "AVG_tGravityAccMag-mean()", "AVG_tGravityAccMag-std()", 
                        "AVG_tBodyAccJerkMag-mean()", "AVG_tBodyAccJerkMag-std()", 
                        "AVG_tBodyGyroMag-mean()", "AVG_tBodyGyroMag-std()", 
                        "AVG_tBodyGyroJerkMag-mean()", "AVG_tBodyGyroJerkMag-std()",
                        "AVG_fBodyAcc-mean()-X", "AVG_fBodyAcc-mean()-Y", "AVG_fBodyAcc-mean()-Z", 
                        "AVG_fBodyAcc-std()-X", "AVG_fBodyAcc-std()-Y", "AVG_fBodyAcc-std()-Z",
                        "AVG_fBodyAccJerk-mean()-X", "AVG_fBodyAccJerk-mean()-Y", "AVG_fBodyAccJerk-mean()-Z", 
                        "AVG_fBodyAccJerk-std()-X",  "AVG_fBodyAccJerk-std()-Y", "AVG_fBodyAccJerk-std()-Z", 
                        "AVG_fBodyGyro-mean()-X", "AVG_fBodyGyro-mean()-Y", "AVG_fBodyGyro-mean()-Z", 
                        "AVG_fBodyGyro-std()-X", "AVG_fBodyGyro-std()-Y", "AVG_fBodyGyro-std()-Z", 
                        "AVG_fBodyAccMag-mean()", "AVG_fBodyAccMag-std()", 
                        "AVG_fBodyBodyAccJerkMag-mean()", "AVG_fBodyBodyAccJerkMag-std()", 
                        "AVG_fBodyBodyGyroMag-mean()", "AVG_fBodyBodyGyroMag-std()", 
                        "AVG_fBodyBodyGyroJerkMag-mean()", "AVG_fBodyBodyGyroJerkMag-std()")

write.table(final_data,"final_output.txt",row.names=FALSE)
