### Getting and Cleaning Data Course Project
Tidying up the Samsung UCI HAR Dataset

This is a course project in completion of the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

- Download the dataset in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Load the activity and features_info
- Load the activity and subject data for each dataset, and merges those columns with the dataset
- Merge the two datasets
- Load the training and test datasets, keeping only those columns which reflect its mean or standard deviation
- Convert the activity and subject columns into factors
- Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file Tidy_Text.txt.
