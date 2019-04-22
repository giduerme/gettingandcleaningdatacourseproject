#Load the dplyr library
library(dplyr)

#Read features.txt
features <- read.table("UCI HAR Dataset/features.txt")

#Read activity_labels.txt
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")



#Read test data sets

#Read X_train.txt and assign column names in it
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(xtrain) <- features[,2]

#Read y_train.txt and assign column names in it
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_number")

#Read subject_train.txt
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

#Merge all train data sets
train <- cbind(xtrain, ytrain, subjecttrain)



#Read test data sets

#Read X_test.txt and assign column names in it
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(xtest) <- features[,2]

#Read y_test.txt and assign column names in it
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_number")

#Read subject_test.txt
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

#Merge all test data sets
test <- cbind(xtest, ytest, subjecttest)


#Merge all test data sets
train_test <- rbind(train, test)


#Get column names with mean and std
colnames <- names(train_test)
newcolnames <- grepl("mean", colnames) | grepl("std", colnames) | grepl("activity_number", colnames) | grepl("subject", colnames)
cleandata<-train_test[,which(newcolnames)]



#Input activity label
labelcleandata <- merge(cleandata, activitylabels, by.x = "activity_number", by.y= "V1", all.x=TRUE, col.names = "activity_label")
colnames(labelcleandata) [82] <- "activity_label"
labelcleandata<-labelcleandata[,c(1,82,81,2:80)]



#Get mean and std
extractedData <- data.table(labelcleandata)

finalcleandata <- aggregate(. ~subject + activity_number + activity_label, extractedData, mean)
finalcleandata <- finalcleandata[order(finalcleandata$subject,finalcleandata$activity_number),]
View(finalcleandata)


#Write table
write.table(finalcleandata, file = "Tidy_Data.txt", row.names = FALSE)
