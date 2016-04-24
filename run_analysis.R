## Download packages data.table and reshape 

library(data.table)
library(reshape2)


## Get  directory; make sure it's the directory you want 
getwd()

## Download zipfile 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./dataset.zip", method = "curl")
UCIdata <- unzip("./dataset.zip")

## check file names for upload 
UCIdata

## Open files to check similarities; read UCIdata's readme and other files for descriptions

## Objective 1: Merges the training and the test sets to create one data set
### Within the process of merging, Objectives 2-4 will be done; 
## (after training and test sets are merged, the right measurements will be extracted and will be labeled with variable names)
##y_train and y_test will  need activity_labels.txt to assign descriptive activity labels. 


# Objective 1: Merges the training and the test sets to create one data set

## Upload test data and train data
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table( "./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

########################

## First, merge the measured data

measureddata <- rbind(xtrain,xtest)

### Then objective 2 can be done
# Objective 2: Extracts only the measurements on the mean and standard deviation for each measurement 

## Download features data; this has measurement labels
measurements <- read.table( "./UCI HAR Dataset/features.txt") 

## Change column names so its easier to merge later
setnames(measurements, "V1", "measurement")
setnames(measurements, "V2", "measurementlabel")

## Find the measurement labels with standard deviation and mean
findmeasurement<- grepl("-[Mm]ean\\(\\)|-[Ss]td\\(\\)", measurements$measurementlabel)

## Extract the columns in measured data that match the position in findmeasurement,
## because this is where measurementlabel is mean or standard devation

measureddata <- measureddata[,findmeasurement]

## Now to finish the extracing we need to get the actual measurement labels
## extracted from the measurements data that have mean or standard deviation calculations
submeasurements <- measurements$measurementlabel[findmeasurement]
as.character(submeasurements)

## Further cleaning of data....
## Need to remove non-letter characters in the measurements
submeasurements <- gsub("\\(|\\)", replacement = "", submeasurements)
submeasurements <- gsub("-", replacement = "", submeasurements)

## Now Objective 4 can be done
## Objective 4: Appropriately labels the data set with descriptive variable names. 
## The names of columns in measureddata needs to be the measurement labels (variable labels)
## that are either mean or standard deviation

## Assign variable names to measureddata
names(measureddata) <- submeasurements


########################

## Next step is to use descriptive names  to name the activites in the data set
## It is known that ytrain and ytest  are the test labels, which correspond
## to the activity_tabels.txt, so they must be merged first before objective 3 can be done
#

## First, merge the test and train labels

datalabels <- rbind(ytrain, ytest)

## The column names of datalabels is still V1 and needs to change to "actvity"
## for easier merging with the activity labels

setnames(datalabels, "V1", "activitynumber")

## Then Objective 3 can be done. 
## Objective 3: Uses descriptive activity names to name the activities in the data set.

## download activity labels data 
activities <- read.table( "./UCI HAR Dataset/activity_labels.txt")

## Change column names so that it can be mered with datalabels
setnames(activities, "V1", "activitynumber")
setnames(activities, "V2", "activitylabels")

## Remove underscore in activity label data 
activities$activitylabels <- sub("_", "", activities$activitylabels)

## Merge datalabels and activity so that desriptive labels can be shown

activity <- merge(datalabels, activities, by = "activitynumber")

## Remove activity number and only show activitylabels

activity <- activity$activitylabels

########################
## Subject numbers from train and test need to merge as well

subjects <- rbind(subjecttrain, subjecttest)

## rename subject column name 
setnames(subjects, "V1", "subject")
##No further cleaning needs to be done.

########################
## Now merge the measured data, with the activity, and the subjects

tidydata <- cbind(subjects, activity, measureddata)

## tidydata needs to be saved in local directory

write.table(tidydata, "tidydata.txt")

########################

## Objective 5: From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable 
## for each activity and each subject.
## Make sure reshape package is loaded

## Melt tidydata, and use subject and activity as the id variables
## because they are the fixed column for the new data

tidymelt <- melt(tidydata, id.vars = c("subject", "activity"))

## Cast to add average of variables in new data 

averagetidydata <- dcast(tidymelt, subject + activity + variable ~., mean)

## Change column name of "." to average

setnames(averagetidydata, ".", "average")

## Save averagetidydata in local directory

write.table(averagetidydata, "averagetidydata.txt")


