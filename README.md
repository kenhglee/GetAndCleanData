I. Required Package

- reshape2

II. Script Description

1. Merges the training and the test sets to create one data set: Using rbind(), test & train data for subject (s), observation (x), and activity (y) data are merged.

2. Extracts only the measurements on the mean and standard deviation for each measurement: Using grepl regular expression, the observation (x) that only contain the exact string of "mean()" and "std()" are selected.

3. Uses descriptive activity names to name the activities in the data set && 4. Appropriately label the data set with descriptive variable names.: The activity table is used to update the activity (y) index with the applicable activity description. 

5. Combine all into one tidy data set out of step 4.: Using cbind(), three data frames are merged to create one large tidy data set.

6. Create a second, independent tidy data set with the average of each variable for each activity and each subject: By using melt() and dcast() in "reshape2" package, the tidy data set gained in step 5 is elongated to restrict the variables and then re-widen to do the aggregation by average observations of each subject (s) and activity (y). 
