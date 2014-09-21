GettngAndCleaningData
=====================

Repo for storing Project Work for Coursera Getting and Cleaning Data Course

run_analysis.R - The code for the project work under Coursera Getting and Cleaning Data course

The files subject_train.txt, y_train.txt, X_train.txt, subject_test.txt, y_test.txt, X_test.txt and run_analysis.R need to be placed in the same directory.

Then, from R Studio or R Console, user needs to navigate to above directory by using the "setwd" function call.

Once in designated directory, user can issue command - source("run_analysis.R").

This would load and execute the necessary code producing output file "final_output.txt" in the same directory.

The column names are as follows:

subject_id - ID of the test subject for whom the data was collected

activity_id - ID of activity corresponding to the measurements. 
              1 - WALKING 
              2 - WALKING_UPSTAIRS
              3 - WALKING_DOWNSTAIRS
              4 - SITTING
              5 - STANDING
              6 - LAYING

AVG_<measurement> - there are 68 such columns containing the average of the measurements considered. Only mean and stadard                     deviation measurements have been considered and then the average of each measurement for each                              subject_id and activity_id combination has been calculated             

