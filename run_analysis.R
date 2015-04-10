# This R script does the following,
# 1.  Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names. 
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

########################################################################
## Set up working directory and load in reshape2 library
# 1. Set working directory
setwd("~/Data Science Specialization/Getting and Cleaning Data/R Code")

# 2.Load in Reshape2 package
library("reshape2", lib.loc="~/R/win-library/3.1")

########################################################################

# 1. Load in descriptive activity names and variable labels (features)
	## NOTE location of UCI HAR Dataset directory ##
activity_labels <- read.table("../UCI HAR Dataset/activity_labels.txt")
features <- read.table("../UCI HAR Dataset/features.txt")

# 2. Load in the test data
x_test <- read.table("../UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("../UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("../UCI HAR Dataset/test/subject_test.txt")

# 3. Load in the training data
x_train <- read.table("../UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("../UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("../UCI HAR Dataset/train/subject_train.txt")

# 4. Assign variable names to test and training data
names(x_test) <- features[,2]
names(x_train) <- features[,2]

# 5. Extract mean() and std() from data (i.e. first six columns of x_test & x_train)
x_test_mean_std <- x_test[,1:6]
x_train_mean_std <- x_train[,1:6]

# 6. Add Activity labels to test and train datasets (as factor levels)
x_test_mean_std$Activity <- factor(y_test[,1],labels=activity_labels[,2])
x_train_mean_std$Activity <- factor(y_train[,1],labels=activity_labels[,2])

# 7. Add Subject Numbers (IDs) to test and train datasets
x_test_mean_std$Subject <- subject_test[,1]
x_train_mean_std$Subject <- subject_train[,1]

# 8. Combine test and train datasets
comb_mean_std <- rbind(x_test_mean_std,x_train_mean_std)

# 9. Use reshape2 "melt" to create long combined dataset
comb_mean_std_melt <- melt(comb_mean_std,id=c("Activity","Subject"))

# 10. Use reshape2 "cast" to create a wide tidy dataset with mean of each observation
comb_mean_std_tidy <- dcast(comb_mean_std_melt,Subject + Activity ~ variable , mean)

# 11. (final step)  Write out tidy dataset
write.table(comb_mean_std_tidy, file="comb_mean_std_tidy.txt", row.names=FALSE)