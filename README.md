## Background
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used for this project represents data collected by the accelerometers on the Samsung Galaxy S smartphone.  
Information about the original data set can be found in the README.TXT file located in the zipped data set that is downloaded as part of the project.  
If you're interested, you can see a full description of the data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

You will be graded by your peers on a series of yes/no questions related to the project.   
The data for the project can be obtained in [this](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) zipfile.  
You will be required to submit:
* A tidy data set with these attributes:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set 
  4. Appropriately labels the data set with descriptive variable names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  6. Complete these tasks in a file called run_analysis.R
* A link to a Github repository with your script for performing the analysis  
* A code book called CodeBook.md. The file should contain descriptions of:  
  * The variables
  * The data
  * Any transformations or work that you performed to clean up the data    
* You should also include a README.md in the repo with your scripts. This file explains how all of the scripts work and how they are connected.


## Repository Contents
File Name | Contents
--- | --- 
README.md | This ReadMe markdown file.
CodeBook.md | The file containing the variable descriptions and how they were obtained.
run_analysis.R | The file containing the statements used to transform the raw data to the result set of *tidy data*. The code is heavily commented to give readers the idea of what is happening. In addition, a code walk-through is included in the CodeBook.md file.
Tidy_Result.txt | Tab delimited text file which averages each variable that was selected from the raw data by the test subject and the activity.

## Code Walk-Through
  The original data set obtained as part of the assignment contained approximately 560 columns of observations.  This data was broken up into two
  sets.  Test data and Training data.  
  >For a full description of the raw data set, I refer you to the documentation that was provided with it in the
  zip file.  The Readme.txt and Features_info.txt explain the organization of the data in complete detail.  
  
  Following are several sections describing the requirements and the steps followed to tidy up the data.  Finally, there is a section naming the variables that remained at the end of the process along with what data type they are.
#### Requirements / Presumptions
* The code requires the `plyr` library
* It is presumed that the downloaded zipped data files reside in the same directory as the run_analysis.R script
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
Tidy_Result.txt | The output Tidy Data set

#### Code Steps
1. Unzip the data into the working folder.
2. Read the Columns labels, called 'Features' in the data set.
3. Read the actual data, it is in the X_test and X_train files.
4. Apply the column names to the data in step 3 from the labels read in step 2.
5. Read the Subject Identifiers.
6. Label the Subject ID data.frame.
7. Append the Subject information read in step 5/6 to the data.
8. Read in the Row Labels, called 'Activities' in the data set.
9. Label the data read in step 8.
10. Append the Activity information, read in step 8/9 to the data.
  *  At this point, I now have the data read in, column names added, the subject id added and the activity id added.
11. Complete requirement 1 - merge into 1 data set
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
  *  Using multiple calls to `gsub` I changed
    1.  Updated a typo which was BodyBody to just Body.
    2. -X to xaxis
    3. -Y to yaxis
    4. -Z to zaxis
    5. changed the std() to stddev
    6. changed the mean() to mean
    7. removed any other parenthesis
    8. removed any other hyphens
    9. made all lower case
    10. overlay the existing names with these new ones.
    11. Copied into a new variable 'tidyData' for clarity
15. Complete requirement 5 - Aggregate the data
  *  Used the `aggregate` function passing it column 3 through the end of the data.frame using `ncols`
  *  Labeled the 2 columns `aggregate` grouped by. (The Subject and Activity) so they are not labeled Group.1 and Group.2
  *  Write the data to a tab delimited file using `write.table`
16. Clean-up
  *  Delete the data files unzipped in the first step using the `unlink` command.



