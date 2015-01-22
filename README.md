#Getting and Cleaning Data
##Course Project

Below are the instructions for the Course Project:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps to utilize run_analysis.r
1. Dowload the data set from the link below. Extract the contents of the zip into your working directory.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Place the run_analysis.R file in the working directory. 

3. If you are not sure where your working directory is, use the getwd() function in RStudio to find the current working directory

4. Open the run_analysis.R file in RStudio and run the script. This will load, merge, and clean the needed data files, following the instructions above, then create a new file, TidyData.txt, in the working directory

##Dependencies
The run_analysis.R script will run with the base R package. No additional packages will have to be loaded. 
