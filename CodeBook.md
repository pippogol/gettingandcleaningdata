# run_analysis.R CodeBook

## Data Set Information
Data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

Data set is obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Steps taken to cleaning data
1. Read subject,x,y from test and train data sets
2. Merge subject, x, y from both sets
3. Merge subject, x, y into one dataset d
4. Read features data and find the feature ID's/names corresponding to means and standard deviations
5. Subset set d by keeping means and standard deviations features only
6. Assign column names by features, subject and activity
7. Read activity data and replace activity ID's in set d with activity names
8. Ouput the clean data set "tidy_dataset.txt"
9. Calculate the average of each variable for each activity and each subject and output another data set "tidy_data_avg.txt"

## Variables
- Subject: A number representing the subject performing the activity
- Activity: Activities performed by the subject
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
- All other columns list the mean and standard deviation measurements as described in the features_info.txt file in the original raw data set.