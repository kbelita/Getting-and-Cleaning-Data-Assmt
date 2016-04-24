# Code Book

This code book has information of the process of the script and variables in data set.

##run_analysis.R
The following were done to produce output tidydata.txt and averagetidydata.txt
* Loads appropriate packages
* Downloads zip file from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Upload test data and train data
* Merge the measured data
* Downloads features data that has measurements and changes column names
* Extracts measurements in features.txt that measures mean and standard deviation by searching for search string
* Removes non-letter characters in variable names
* Assigns variable names to measured data
* Merges the test and train labels
* Changes column name of new labels data set for easier merging with activity data
* Loads activity labels data 
* Changes column names so that it can be mered with datalabels
* Remove underscore in activity label data 
* Merge datalabels and activity so that desriptive labels can be shown
* Remove activity number and only show activitylabels
* Merges subject numbers from train and test 
* Merges subject, activity, and measurements 
* write table in to tidydata.txt
* creates independent tidy data set with the average of each variable for each activity and each subject by melting and casting
* writes new average tidy data in to averagetidydata.txt



## Variables

* subject 	- identifies the subject that performed activity: 1-30
* activity 	- identifies the activity performed by the subject: WALKING, WALKINGUPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone, Samsung Galaxy S II
* measurement variables that included measurement of mean value and standard deviation based on signals produced by the smartphone
    * tBodyAccmeanY  
    * tBodyAccmeanZ  
    * tBodyAccstdX  
    * tBodyAccstdY  
    * tBodyAccstdZ  
    * tGravityAccmeanX  
    * tGravityAccmeanY 
    * tGravityAccmeanZ  
    * tGravityAccstdX  
    * tGravityAccstdY  
    * tGravityAccstdZ  
    * tBodyAccJerkmeanX 
    * tBodyAccJerkmeanY 
    * tBodyAccJerkmeanZ  
    * tBodyAccJerkstdX  
    * tBodyAccJerkstdY  
    * tBodyAccJerkstdZ  
    * tBodyGyromeanX  
    * tBodyGyromeanY 
    * tBodyGyromeanZ  
    * tBodyGyrostdX  
    * tBodyGyrostdY 
    * tBodyGyrostdZ  
    * tBodyGyroJerkmeanX 
    * tBodyGyroJerkmeanY 
    * tBodyGyroJerkmeanZ  
    * tBodyGyroJerkstdX 
    * tBodyGyroJerkstdY 
    * tBodyGyroJerkstdZ  
    * tBodyAccMagmean  
    * tBodyAccMagstd  
    * tGravityAccMagmean  
    * tGravityAccMagstd 
    * tBodyAccJerkMagmean 
    * tBodyAccJerkMagstd  
    * tBodyGyroMagmean  
    * tBodyGyroMagstd  
    * tBodyGyroJerkMagmean 
    * tBodyGyroJerkMagstd 
    * fBodyAccmeanX  
    * fBodyAccmeanY  
    * fBodyAccmeanZ  
    * fBodyAccstdX  
    * fBodyAccstdY  
    * fBodyAccstdZ  
    * fBodyAccJerkmeanX 
    * fBodyAccJerkmeanY 
    * fBodyAccJerkmeanZ 
    * fBodyAccJerkstdX  
    * fBodyAccJerkstdY  
    * fBodyAccJerkstdZ  
    * fBodyGyromeanX  
    * fBodyGyromeanY 
    * fBodyGyromeanZ  
    * fBodyGyrostdX  
    * fBodyGyrostdY  
    * fBodyGyrostdZ  
    * fBodyAccMagmean  
    * fBodyAccMagstd  
    * fBodyBodyAccJerkMagmean 
    * fBodyBodyGyroJerkMagmean 
    * fBodyBodyGyroJerkMagstd 

