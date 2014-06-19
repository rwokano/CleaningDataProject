## Background
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
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
README.md| This ReadMe markdown file.
CodeBook.md| The file containing the variable descriptions, and a description of the processing done in the code file *run_analysis.R*
run_analysis.R| The file containing the statements used to transform the raw data to the result set of *tidy data*
Tidy_Result.txt| Tab delimited text file which averages each varibale in the raw data (that is a Mean or Std Dev) by the test subject and the activity.

