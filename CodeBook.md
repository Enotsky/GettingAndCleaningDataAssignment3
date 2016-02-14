# CodeBook
This CodeBook describes the code inside run_analysis.R script
The script aim was only to meet the requirements of Course Project Assignment, so the resulting dataset is not absolutly tidy.

## Basic features
* The script works with a downloaded and extracted from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The script works in UCI HAR Dataset folder as a working directory
* The script uses dplyr package

## Variableslist
### Data read from files (dataframes)
* activity_labels - a dataset of activity names (activity_labels.txt imported)
* features - a dataset of measured variables (features.txt imported)
* subject_test - a dataset of subjects of measurements in test (subject_test.txt imported)
* subject_train - a dataset of subjects of measurements in training (subject_train.txt imported)
* y_test - a dataset of activities measured in test (y_test.txt imported)
* y_train - a dataset of activities measured in training (y_train.txt imported)
* X_test - a dataset of measurements in test (X_test.txt imported)
* X_train - a dataset of measurements in training (X_train.txt imported)

### Intermediate datasets (dataframes)
* full_dataset - a dataset containing all the information on test and training measuremets
* test_dataset - a dataset containing all the information on test measurements (subject, activity labels and measured data)
* train_dataset - a dataset containing all the information on training measurements (subject, activity labels and measured data)

### Intermediate variables (vectors)
ext - a vector of indexes of columns to extract (mean and standard deviation of measurements)
mean_names - a vector of indexes of column names containing 'mean'
std_names - a vector of indexes of column names containing 'std'

## Resulting Datasets (dataframes)
summary_dataset - a dataset of measurements grouped by subjects and activities
tidy_dataset - a dataset of mean ans std measurements
