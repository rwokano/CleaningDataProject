##Data Elements
#### Data Collection
> ###### Quoted from ReadMe.txt contained in the data download.
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> #####For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Data Calculations
The full data description can be found in the 'features.txt' file of the downloaded data.  Below is a subset of the information concerning the data elements and the naming convention which was taken from the *feaure_info.txt* .
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
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean    

Per the assignment instructions, only elements containing `mean()` or `std()` were included in the result set. All other elements were dropped.
Below is a table mapping the original column name to the tidy name as it is in the 'tidy_Result.txt' file.  Also included is the type of data.  Of the approx 560 variables in the initial data set, only 66 remain in the output data set.

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


 



































































