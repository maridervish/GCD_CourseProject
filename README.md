## Getting-and-cleaning-data_Course-Project

This repository contains script which processes results of experiment made by SmartLab (details can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#Script run_analysis.R does following:

1. Reading results of experiment (group "test") into R, variables: test, test_labels, test_subject.
2. Combining dataframes related to test results into a new variable test_data
3. Reading results of experiment (group "train") into R, variables: train, train_labels, train_subject.
4. Combining dataframes related to train results into a new variable "train_data".
5. Combining test and train results together into a new variable "data".
6. Reading names of measurments into dataframe "features"
7. Creating a logical vector referring to whether or not measurment name contains mean ("mean()") or standard deviation ("std()").
8. Creating vector "colnames" with only measurment names containing mean or standard deviation.
9. Extracting into new variable "data_mean_std" from combined data only columns "Act_Label", "Subject", and measurements on the mean and standard deviation (using logical vector created in step 7).
10. Reading dataframe with Activity Labels and corresponding Activity names into "activity_names"
11. Adding new variable "Activity" to filtered dataset by merging together "data_mean_std" and "activity_names" using activity label as key.
12. Applies descriptive column names from vector created in step 8 to new dataset.
13. In the last step script creates summary on filtered data with the average of each measurment for each activity and each subject of experiment and writes result into text file.