## Code Walk-Through
  The original data set obtained as part of the assignment contained approximately 560 columns of observations.  This data was broken up into two
  sets.  Test data and Training data.  
  >For a full description of the raw dataset, I refer you to the documentation that was provided with it in the
  zip file.  The Readme.txt and Features_info.txt explain the organization of the data in complete detail.  
  
  Following are several sections describing the requirements and the steps followed to tidy up the data.  Finally, there is a section naming the variables that remained at the end of the process along with what data type they are.
#### Requirements / Presumptions
* The code requires the `plyr` library
* It is presumed that the downloaded zipped datafiles reside in the same directory as the run_analysis.R script
* It is also presumed that the working directory has been set to this location
* I also did not optimize this code, it is heavily commented and almost always uses a new variable so the work can be easily traced.  For optimization, I would re-use the variables to reduce memory usage.

#### Files Used  

File Name | Contents  
--- | ---
getdata_projectfiles_UCI HAR Dataset.zip | Download file containing all the other files
features.txt | Column Labels
X_test.txt | Test Subject Data
X_train.txt | Training Subject Data
subject_test.txt | The Subject IDs for the X_test file
subject_train.txt | The Subject IDs for the X_train file
y_test.txt | The Activity IDs for the x_test file
y_train.txt | The Activity IDs for the x_train file
activity_labels.txt | The descriptive values the match the Activity ID
Tidy_Result.txt | The output Tidy Dataset

#### Code Steps
1. Unzip the data into the working folder.
2. Read the Columns labels, called 'Features' in the dataset.
3. Read the actual data, it is in the X_test and X_train files.
4. Apply the column names to the data in step 3 from the labels read in step 2.
5. Read the Subject Identifiers.
6. Label the Subject ID data.frame.
7. Append the Subject information read in step 5/6 to the data.
8. Read in the Row Labels, called 'Activities' in the dataset.
9. Label the data read in step 8.
10. Append the Activity information, read in step 8/9 to the data.
  *  At this point, I now have the data read in, column names added, the subject id added and the activity id added.
11. Complete requirement 1 - merge into 1 dataset
12. Complete requirement 2, select only variables that have mean() or std() in them
  *  Used separate `grep` function calls to get the column names to keep
  *  Be sure to keep column 1 and 2 which contain the Subject and Activity id's
  *  Using [,] notation select on the columns from above
  *  Stored this into new variable 'subsetData' for clarity
13. Complete requirement 3 - Add descriptive names
  *  Read in the Activity Descriptions from the file
  *  Label the columns ID and Description respectively
  *  Do a right `join` on the data and these descriptions. All records should match but do an outer join just in case.
  *  This was stored in a new variable `subsetDataWithNames`, again for clarity.
  *  Drop column 1, which was the Activity ID. We no longer need it since the Description is present.
14. Complete requirement 4 - Add descriptive column names
  *  From above, I have already labeled the columns. I do not have V1, V2 V3 etc.  Personally, I would prefer to camel case the names, but the lecture seemed to indicate all lowercase, no hyphens, no underscores.  I feel this makes the variables difficult to use, but did so as I believe that was what was expected in the assignment.
  *  Using multipe calls to `gsub` I changed
    1.  Updated a typo which was BodyBody to just Body.
    2. -X to xaxis
    3. -Y to yaxis
    4. -Z to zaxis
    5. changed the std() to stddev
    6. changed the mean() to mean
    7. removed any other parenthesis
    8. removed any other hyphens
    9. made all lower case
    10. overlay the exisiting names with these new ones.
    11. Copied into a new variable 'tidyData' for clarity
15. Complete requirement 5 - Aggregate the data
  *  Used the `aggregate` function passing it column 3 through the end of the data.frame using `ncols`
  *  Labeled the 2 coumns `aggregate` grouped by. (The Subject and Activity) so they are not labeled Group.1 and Group.2
  *  Write the data to a tab delimted file using `write.table`
16. Clean-up
  *  Delete the data files unzipped in the first step using the `unlink` command.


##Data Elements
The full data description can be found in the 'features.txt' file of the downloaded data.  Below is a general summary of the data elememts and the naming convention which was taken from the *feaure_info.txt* .
> ###### Quoted from the feature_info.txt contained in the data download.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

>These signals were used to estimate variables of the feature vector for each pattern:  
>   '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean    

Per the assignment instructions, only elements containing `mean()` or `std()` were included in the result set. All other elements were dropped.
Below is a table mapping the original column name to the tidy name as it is in the 'tidy_Result.txt' file.  Also included is the type of data.  Of the approx 560 variables in the initial dataset, only 66 remain in the output dataset.

Column Number | Original Name | Tidy Name | Data Type  
---| --- | --- | ---  
1 | *not provided*                   | subjectid | integer  
2 | *not provided*         | activitydescription | factor  
3 | tBodyAcc-mean()-X           | tbodyaccmeanxaxis       | numeric  
4 | tBodyAcc-mean()-Y           | tbodyaccmeanyaxis | numeric             
5 | tBodyAcc-mean()-Z           | tbodyaccmeanzaxis | numeric              
6 | tBodyAcc-std()-X            | tbodyaccstddevxaxis     | numeric   
7 | tBodyAcc-std()-Y            | tbodyaccstddevyaxis | numeric              
8 | tBodyAcc-std()-Z            | tbodyaccstddevzaxis | numeric          
9 | tGravityAcc-mean()-X        | tgravityaccmeanxaxis    | numeric  
10 | tGravityAcc-mean()-Y        | tgravityaccmeanyaxis | numeric         
11 | tGravityAcc-mean()-Z        | tgravityaccmeanzaxis | numeric          
12 | tGravityAcc-std()-X         | tgravityaccstddevxaxis  | numeric  
13 | tGravityAcc-std()-Y         | tgravityaccstddevyaxis | numeric         
14 | tGravityAcc-std()-Z         | tgravityaccstddevzaxis | numeric       
15 | tBodyAccJerk-mean()-X       | tbodyaccjerkmeanxaxis   | numeric   
16 | tBodyAccJerk-mean()-Y       | tbodyaccjerkmeanyaxis | numeric         
17 | tBodyAccJerk-mean()-Z       | tbodyaccjerkmeanzaxis | numeric          
18 | tBodyAccJerk-std()-X        | tbodyaccjerkstddevxaxis | numeric  
19 | tBodyAccJerk-std()-Y        | tbodyaccjerkstddevyaxis | numeric         
20 | tBodyAccJerk-std()-Z        | tbodyaccjerkstddevzaxis | numeric           
21 | tBodyGyro-mean()-X          | tbodygyromeanxaxis      | numeric  
22 | tBodyGyro-mean()-Y          | tbodygyromeanyaxis | numeric         
23 | tBodyGyro-mean()-Z          | tbodygyromeanzaxis | numeric          
24 | tBodyGyro-std()-X           | tbodygyrostddevxaxis    | numeric  
25 | tBodyGyro-std()-Y           | tbodygyrostddevyaxis | numeric         
26 | tBodyGyro-std()-Z           | tbodygyrostddevzaxis | numeric    
27 | tBodyGyroJerk-mean()-X      | tbodygyrojerkmeanxaxis  | numeric   
28 | tBodyGyroJerk-mean()-Y      | tbodygyrojerkmeanyaxis | numeric        
29 | tBodyGyroJerk-mean()-Z      | tbodygyrojerkmeanzaxis | numeric         
30 | tBodyGyroJerk-std()-X       | tbodygyrojerkstddevxaxi | numeric  
31 | tBodyGyroJerk-std()-Y       | tbodygyrojerkstddevyaxi | numeric        
32 | tBodyGyroJerk-std()-Z       | tbodygyrojerkstddevzaxi | numeric           
33 | tBodyAccMag-mean()          | tbodyaccmagmean         | numeric  
34 | tBodyAccMag-std()           | tbodyaccmagstddev | numeric    
35 | tGravityAccMag-mean()       | tgravityaccmagmean | numeric         
36 | tGravityAccMag-std()        | tgravityaccmagstddev    | numeric  
37 | tBodyAccJerkMag-mean()      | tbodyaccjerkmagmean | numeric         
38 | tBodyAccJerkMag-std()       | tbodyaccjerkmagstddev | numeric          
39 | tBodyGyroMag-mean()         | tbodygyromagmean        | numeric  
40 | tBodyGyroMag-std()          | tbodygyromagstddev | numeric   
41 | tBodyGyroJerkMag-mean()     | tbodygyrojerkmagmean | numeric        
42 | tBodyGyroJerkMag-std()      | tbodygyrojerkmagstddev  | numeric  
43 | fBodyAcc-mean()-X           | fbodyaccmeanxaxis | numeric       
44 | fBodyAcc-mean()-Y           | fbodyaccmeanyaxis | numeric       
45 | fBodyAcc-mean()-Z           | fbodyaccmeanzaxis       | numeric  
46 | fBodyAcc-std()-X            | fbodyaccstddevxaxis | numeric       
47 | fBodyAcc-std()-Y            | fbodyaccstddevyaxis | numeric       
48 | fBodyAcc-std()-Z            | fbodyaccstddevzaxis     | numeric  
49 | fBodyAccJerk-mean()-X       | fbodyaccjerkmeanxaxis | numeric       
50 | fBodyAccJerk-mean()-Y       | fbodyaccjerkmeanyaxis | numeric       
51 | fBodyAccJerk-mean()-Z       | fbodyaccjerkmeanzaxis   | numeric  
52 | fBodyAccJerk-std()-X        | fbodyaccjerkstddevxaxis | numeric       
53 | fBodyAccJerk-std()-Y        | fbodyaccjerkstddevyaxis | numeric       
54 | fBodyAccJerk-std()-Z        | fbodyaccjerkstddevzaxis | numeric  
55 | fBodyGyro-mean()-X          | fbodygyromeanxaxis | numeric       
56 | fBodyGyro-mean()-Y          | fbodygyromeanyaxis  | numeric       
57 | fBodyGyro-mean()-Z          | fbodygyromeanzaxis      | numeric  
58 | fBodyGyro-std()-X           | fbodygyrostddevxaxis | numeric       
59 | fBodyGyro-std()-Y           | fbodygyrostddevyaxis | numeric       
60 | fBodyGyro-std()-Z           | fbodygyrostddevzaxis    | numeric  
61 | fBodyAccMag-mean()          | fbodyaccmagmean | numeric        
62 | fBodyAccMag-std()           | fbodyaccmagstddev | numeric  
63 | fBodyBodyAccJerkMag-mean()  | fbodyaccjerkmagmean     | numeric   
64 | fBodyBodyAccJerkMag-std()   | fbodyaccjerkmagstddev | numeric      
65 | fBodyBodyGyroMag-mean()     | fbodygyromagmean | numeric     
66 | fBodyBodyGyroMag-std()      | fbodygyromagstddev      | numeric  
67 | fBodyBodyGyroJerkMag-mean() | fbodygyrojerkmagmean | numeric  
68 | fBodyBodyGyroJerkMag-std()  | fbodygyrojerkmagstddev  | numeric   


 



































































