Project: Getting and Cleaning Data Course Project

This repository contains the following files:

# run_analysis.R

This script use as input, data collected from embedded accelerometer and gyroscope from the 
Samsung Galaxy S smartphone, with 30 subjects performed six activities: WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The script creates a tidy data set with the average of mean and std variables for each activity and each subject.

For use this script the following zip file must be downloaded and unzipped in the working folder.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Link with full description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The run_analysis.R script does the following tasks:

1. Load tables.
2. Merge test and train tables in x, y and subject tables.
3. Extract features with mean and std. 
4. Set descriptive names to columns.
5. Factorize values of activites, with descriptive labels.
6. Summarize data by activities and subjects, using dpliy library and mean.
7. Write a tidy data set file.

# tidy_data_set.csv

File with the tidy data set.

# CodeBook.md

Code book that describes the variables, the data, and transformations doing for the script.







  