Getting and Cleaning Data Course Project
Tidying up the Samsung UCI HAR Dataset

This is a course project in completion of the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

1.) Download the dataset in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.) Load the activity and features_info
3.) Load the activity and subject data for each dataset, and merges those columns with the dataset
4.) Merge the two datasets
5.) Load the training and test datasets, keeping only those columns which reflect its mean or standard deviation
6.) Convert the activity and subject columns into factors
7.) Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file Tidy_Text.txt.
