# setwd("D:/Repository/Getting and Cleaning Data")

# Load dpliy library
library(dplyr)

# Load tables
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merge test and train tables
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

# Load table with features
features <- read.table("./UCI HAR Dataset/features.txt")

# Get index of features with mean and std
i_feature <- grep("mean|std",features[,2])

# Get and clear names of required features
name_feature <- features[i_feature,2]
name_feature <- gsub("[()]","",name_feature)

# Crate dataframe with required features and assign names to columns
x <- x[,i_feature]
colnames(x) <- name_feature

# Change name of activity column
colnames(y) <- "Activity"

# Load table with activities labels. Factorize values with this labels.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
y$Activity <- factor(y$Activity, levels=c(1:6), labels = activity_labels[,2])

# Change name of subject column
colnames(subject) <- "Subject"

# Merge dataframes of activity, subject and features 
data <- cbind(y, subject)
data <- cbind(data, x)

# Summarize data by activities and subjects, using mean.
summ <- data %>% group_by(Activity,Subject) %>% summarize_all(mean)

# Write tidy data set.
write.table(summ, "tidy_data_set.txt", row.name=FALSE)

