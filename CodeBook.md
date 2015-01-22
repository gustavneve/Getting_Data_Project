#Getting and Cleaning Data

##Code Book

This code book describes the data source, variables, and methods for manipulating the data involved in the cource project for Getting and Cleaning Data.

##Data Source

The data is sourced from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

[The zipped data set can be downloaded here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#Basic Data Set Information (this information is quoted from The UCI Machine Learning Repository link abovealso available in the README.txt file included in the data set)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Attribute Information (this information is quoted from The UCI Machine Learning Repository link above, also available in the README.txt file included in the data set)
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#The Data Set

There are 10 files used in this project.
1. README.txt - Contains basic description of the data set
2. activity_labels.txt - Contains the activity label (numeric) and its description
3. features.txt - List of features used in the train and test files
4. features_info.txt - Contains basic description of the variables used in the features.txt file
5. subject_test, y_test, X_test - Found in the test directory, these files contain the subject (volunteer), activity labels, and  test result data, respectively.
6. subject_train, y_train, X_train - Found in the train directory, these files contain the subject (volunteer), activity labels, and train result data, respectively.

Other files, contained in an Inertial Signals directory under test and train, has files containing the acceleration and body acceleration signals from the smartphone and angular velocity measured by the gyroscope.

##Required steps to manipulate data

Build one R script that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##`run_analysis.R`
The `run_analysis.R` script will complete the above steps by:
1. Loading the necessary data from the working directory
2. Merge the test data into a single data set
3. Merge the train data into a single data set
4. Merge the test and train data to form one master data set. This data set includes subject and activity data
5. Limit the data set to only mean and standard deviation observations
6. Using the labels in the activity_labels.txt file, name the activities in the data set
7. Replace the shorthand labels in the data set with more descriptive labels
8. Create a new data set that aggregates the data by subject and activity, providing a mean for each variable
9. Create a text file `TidyData.txt`

For information on how to run the script, please refer to the README.md file in this repository.