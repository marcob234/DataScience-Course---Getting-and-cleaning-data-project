# Getting and Cleaning Data

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to follow for this project

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in a working folder.  The working folder is within the same directory as ```UCI HAR Dataset```.  
3. Run ```source("run_analysis.R")```, then it will generate a new file ```comb_mean_std_tidy.txt``` in your working directory.

## Libraries

```run_analysis.R``` file will install ```reshape2``` library automatically.