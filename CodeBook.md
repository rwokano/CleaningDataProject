## Code Walk-Through
  The original data set obtained as part of the assignment contained approximately 560 columns of observations.  This data was broken up into two
  sets.  Test data and Training data.  
  >For a full description of the raw dataset, I refer you to the documentation that was provided with it in the
  zip file.  The Readme.txt and Features.txt explain the organization of the data in complete detail.
### Requirements
* The code requires the plyr library
* It is presumed that the downloaded zipped datafiles reside in the same directory as the run_analysis.R script
* It is also presumed that the working directory has been set to this location

### Code Steps


##Variables
Original Name | Tidy Name | Data Type
--- | --- | ---
subjectid                   | subjectid | integer
activitydescription         | activitydescription | factor
tBodyAcc-mean()-X           | tbodyaccmeanxaxis       | numeric
tBodyAcc-mean()-Y           | tbodyaccmeanyaxis | numeric           
tBodyAcc-mean()-Z           | tbodyaccmeanzaxis | numeric            
tBodyAcc-std()-X            | tbodyaccstddevxaxis     | numeric 
tBodyAcc-std()-Y            | tbodyaccstddevyaxis | numeric            
tBodyAcc-std()-Z            | tbodyaccstddevzaxis | numeric        
tGravityAcc-mean()-X        | tgravityaccmeanxaxis    | numeric
tGravityAcc-mean()-Y        | tgravityaccmeanyaxis | numeric       
tGravityAcc-mean()-Z        | tgravityaccmeanzaxis | numeric        
tGravityAcc-std()-X         | tgravityaccstddevxaxis  | numeric
tGravityAcc-std()-Y         | tgravityaccstddevyaxis | numeric       
tGravityAcc-std()-Z         | tgravityaccstddevzaxis | numeric     
tBodyAccJerk-mean()-X       | tbodyaccjerkmeanxaxis   | numeric 
tBodyAccJerk-mean()-Y       | tbodyaccjerkmeanyaxis | numeric       
tBodyAccJerk-mean()-Z       | tbodyaccjerkmeanzaxis | numeric        
tBodyAccJerk-std()-X        | tbodyaccjerkstddevxaxis | numeric
tBodyAccJerk-std()-Y        | tbodyaccjerkstddevyaxis | numeric       
tBodyAccJerk-std()-Z        | tbodyaccjerkstddevzaxis | numeric         
tBodyGyro-mean()-X          | tbodygyromeanxaxis      | numeric
tBodyGyro-mean()-Y          | tbodygyromeanyaxis | numeric       
tBodyGyro-mean()-Z          | tbodygyromeanzaxis | numeric        
tBodyGyro-std()-X           | tbodygyrostddevxaxis    | numeric
tBodyGyro-std()-Y           | tbodygyrostddevyaxis | numeric       
tBodyGyro-std()-Z           | tbodygyrostddevzaxis | numeric  
tBodyGyroJerk-mean()-X      | tbodygyrojerkmeanxaxis  | numeric 
tBodyGyroJerk-mean()-Y      | tbodygyrojerkmeanyaxis | numeric      
tBodyGyroJerk-mean()-Z      | tbodygyrojerkmeanzaxis | numeric       
tBodyGyroJerk-std()-X       | tbodygyrojerkstddevxaxi | numeric
tBodyGyroJerk-std()-Y       | tbodygyrojerkstddevyaxi | numeric      
tBodyGyroJerk-std()-Z       | tbodygyrojerkstddevzaxi | numeric         
tBodyAccMag-mean()          | tbodyaccmagmean         | numeric
tBodyAccMag-std()           | tbodyaccmagstddev | numeric  
tGravityAccMag-mean()       | tgravityaccmagmean | numeric       
tGravityAccMag-std()        | tgravityaccmagstddev    | numeric
tBodyAccJerkMag-mean()      | tbodyaccjerkmagmean | numeric       
tBodyAccJerkMag-std()       | tbodyaccjerkmagstddev | numeric        
tBodyGyroMag-mean()         | tbodygyromagmean        | numeric
tBodyGyroMag-std()          | tbodygyromagstddev | numeric 
tBodyGyroJerkMag-mean()     | tbodygyrojerkmagmean | numeric      
tBodyGyroJerkMag-std()      | tbodygyrojerkmagstddev  | numeric
fBodyAcc-mean()-X           | fbodyaccmeanxaxis | numeric     
fBodyAcc-mean()-Y           | fbodyaccmeanyaxis | numeric     
fBodyAcc-mean()-Z           | fbodyaccmeanzaxis       | numeric
fBodyAcc-std()-X            | fbodyaccstddevxaxis | numeric     
fBodyAcc-std()-Y            | fbodyaccstddevyaxis | numeric     
fBodyAcc-std()-Z            | fbodyaccstddevzaxis     | numeric
fBodyAccJerk-mean()-X       | fbodyaccjerkmeanxaxis | numeric     
fBodyAccJerk-mean()-Y       | fbodyaccjerkmeanyaxis | numeric     
fBodyAccJerk-mean()-Z       | fbodyaccjerkmeanzaxis   | numeric
fBodyAccJerk-std()-X        | fbodyaccjerkstddevxaxis | numeric     
fBodyAccJerk-std()-Y        | fbodyaccjerkstddevyaxis | numeric     
fBodyAccJerk-std()-Z        | fbodyaccjerkstddevzaxis | numeric
fBodyGyro-mean()-X          | fbodygyromeanxaxis | numeric     
fBodyGyro-mean()-Y          | fbodygyromeanyaxis  | numeric     
fBodyGyro-mean()-Z          | fbodygyromeanzaxis      | numeric
fBodyGyro-std()-X           | fbodygyrostddevxaxis | numeric     
fBodyGyro-std()-Y           | fbodygyrostddevyaxis | numeric     
fBodyGyro-std()-Z           | fbodygyrostddevzaxis    | numeric
fBodyAccMag-mean()          | fbodyaccmagmean | numeric      
fBodyAccMag-std()           | fbodyaccmagstddev | numeric
fBodyBodyAccJerkMag-mean()  | fbodyaccjerkmagmean     | numeric 
fBodyBodyAccJerkMag-std()   | fbodyaccjerkmagstddev | numeric    
fBodyBodyGyroMag-mean()     | fbodygyromagmean | numeric   
fBodyBodyGyroMag-std()      | fbodygyromagstddev      | numeric
fBodyBodyGyroJerkMag-mean() | fbodygyrojerkmagmean | numeric
fBodyBodyGyroJerkMag-std()  | fbodygyrojerkmagstddev  | numeric 
 



































































