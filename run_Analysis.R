##  This file to create a tidy dataset from the Test and Training Data files located in 
## the zip file "getdata_projectfiles_UCI HAR Dataset.zip" as provided for the assignment
## --> I am using the assmption that the ZIP file exists in the working directory of the project.
## --> In most of the steps below, I create new variables.  I could have overlaid the existing
##     variables as I manipulated the data, but I did not so you can run the code and see 
##     the data changes side by side.

## load the plyr library
require(plyr)

## Open the Zip file
unzip("getdata_projectfiles_UCI HAR Dataset.zip")

## Read the Columns labels (features)
colLabels<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)

## Data is in the X_test / X_train files, read them in 
testData<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
trainData<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)

## Put the column name on the files
colnames(testData)<-colLabels[,2]
colnames(trainData)<-colLabels[,2]

## Get the Subject (person) information
testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## Name the subject column
colnames(testSubject)<-c("Subject.ID")
colnames(trainSubject)<-c("Subject.ID")

## Append the columns
testData<-cbind(testSubject,testData)
trainData<-cbind(trainSubject,trainData)

## Read the Row Labels (The activity for each row, these will be a Key to the activity file)
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)

## add a column name, same as the activity table so can be used to join later
colnames(testLabels)<-c("Activity.ID")
colnames(trainLabels)<-c("Activity.ID")

## Put the Row Labels onto the files
testDataLabeled<-cbind(testLabels,testData)
trainDataLabeled<-cbind(trainLabels,trainData)

## Now the test and train datasets has all the column it needs and they are properly named
## For Requirement 1, merge the data sets together
mergedData<-rbind(testDataLabeled,trainDataLabeled)

## At this point, we have one combined data set with column names, and the Row labels so I can
## lookup the activity for each row.  Now I will just pick out the mean and std dev columns
## requested in requirement 2

## Find the column #'s for the Mean variables (Looked at col names to find strings to use)
## Be sure to use the FIXED parameter so we get only the exact matches, not the xxx-meanfreq
## columns as well.
meanCols = grep("mean()", names(mergedData),fixed=TRUE)

## Same for StdDev cols
stdCols = grep("std()", names(mergedData),fixed=TRUE)

## Now we can pick just the columns we want, don't forget column 1 which is the label and
## column 2 which is the Subject ID.  Finally, we should sort the column list, so the
## columns stay in the same order as the orginal data
subsetData<-mergedData[,sort(c(1,2,meanCols,stdCols))]

## Requirement 3, add the descriptive names
## Read the Activity Definitions (These are the descriptive names for the row labels)
activityDefs<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
## Add column names
colnames(activityDefs)<-c("Activity.ID","Activity.Description")

## Using the Activity ID we added to each row earlier, and this new data frame, join them
## on Activity_ID to put the descriptive name on the row
subsetDataWithNames<-join(activityDefs,subsetData,by="Activity.ID",type="right")

## Now remove column 1, which is the Activity ID
subsetDataWithNames<-subsetDataWithNames[,-1]

## Requirement 4, Descriptive column names .. already done.
## Note: I added the feature names when the data was read, so I already do not have V1, V2 etc.
##      But I do need to clean the names from what was provided.
##      I personally would prefer to use camel case variables, the lecture notes seemed to indicate
##      that we shoudl use all small letters, no underscores, no parenthesis, no hypens just 
##      long names that seem difficult to read (IMO) but I will do that
## First, I noticed some apparent typo's near the end of the data where there is BodyBody, lets correct that first
nameCleaning<-gsub("BodyBody","Body",colnames(subsetDataWithNames),fixed=TRUE)
## Now replace the -X with xaxis, the -Y with yaxis and -Z with zaxis
nameCleaning<-gsub("-X","xaxis",nameCleaning,fixed=TRUE)
nameCleaning<-gsub("-Z","zaxis",nameCleaning,fixed=TRUE)
nameCleaning<-gsub("-Y","yaxis",nameCleaning,fixed=TRUE)
## Now remove the Parenthesis
nameCleaning<-gsub("std()","stddev",nameCleaning,fixed=TRUE)
nameCleaning<-gsub("mean()","mean",nameCleaning,fixed=TRUE)
## Now any remaining -
nameCleaning<-gsub("-","",nameCleaning,fixed=TRUE)
## finally make sure it is all lower case
nameCleaning<-tolower(nameCleaning)
## Reassign the names
colnames(subsetDataWithNames)<-nameCleaning

## For clarity (i.e to know we are done cleaning), move the work df to a tidyData result data.frame
tidyData<-subsetDataWithNames


## Requirement 5 - summarize the data
## use the Aggregate function to apply MEAN to all of the columns.  Note, do not include
## columns 1 and 2 since they are the "by" clause, so use col 3 through the end of the data frame
## as determined by the function ncols
tidyDataAggregated<-aggregate(tidyData[3:ncol(tidyData)], by=list(tidyData$subject.id,tidyData$activity.description), FUN="mean")
## Fix the Group.1 and Group.2 names
colnames(tidyDataAggregated)[1:2]<-c("subjectid", "activitydescription")

## Write out the tidy data set
write.table(tidyDataAggregated, file = "Tidy_Result.txt", append = FALSE, row.names=FALSE, quote=FALSE, sep="\t")

## Clean up
## Delete the unzipped folder
unlink("./UCI HAR Dataset",recursive=TRUE)