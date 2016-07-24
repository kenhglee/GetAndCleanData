## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("reshape2")

## 1. Merge the training and the test sets to create one data set.

x_data <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"), 
                read.table("./UCI HAR Dataset/test/X_test.txt"))

y_data <- rbind(read.table("./UCI HAR Dataset/train/y_train.txt"),
                read.table("./UCI HAR Dataset/test/y_test.txt"))

s_data <- rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"),
                read.table("./UCI HAR Dataset/test/subject_test.txt"))

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")[,2]
names(x_data) <- features
extract_features <- grepl("mean\\(\\)|std\\(\\)", features)
x_data <- x_data[,extract_features]

## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names.

activity <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
names(y_data) <- "activity"
names(s_data) <- "subject"
y_data$activity <- activity[y_data$activity]

##5. Combine all into one tidy data set out of step 4

t_data <- cbind(s_data, y_data, x_data)
write.table(t_data, "tidy_dataset_1.txt")

##6. Create a second, independent tidy data set with the average of each variable 
## for each activity and each subject.

m_data <- melt(t_data, id.vars = c("subject", "activity"))
tidy_data <- dcast(m_data, subject + activity ~ variable, mean)

write.table(tidy_data, "tidy_dataset.txt")
