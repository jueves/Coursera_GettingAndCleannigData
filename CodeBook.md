#Original data set
Data is get from experiments from the proyect *Human Activity Recognition Using Smartphones* carried by Non Linear Complex Systems Laboratory in Smartlab, Genova, Italy. It involves a series of activities performed by subjects while wearing a smartphone atached to their waist.
You can find extended information about the dataset in [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#Data set variables
This dataset has 562 variables, 561 of which are properly described in the original file `~/UCI HAR Dataset/features_info.txt` downloaded and extracted by `run_analysis.R`.

An additional variable *subject* has been added to match each observation with the subject who performed it based on `~/UCI HAR Dataset/test/subject_test.txt` and `~/UCI HAR Dataset/train/subject_train.txt`.

#Transformations made
The script `run_analysis.R` performs the following modifications over the original data.
* Descriptive activity names in `~/UCI HAR Dataset/activity_labels.txt` used to name the activities in `~/UCI HAR Dataset/features.txt`.
* Data set labeled with descriptive variable names from `~/UCI HAR Dataset/features.txt`.
* Training and test sets merged to create one data set and wich is exported to `~/UCI HAR Dataset/TidyData_FULL.csv`.
* Measurements on the mean and standard deviation extracted for each measurement and exported to `~/UCI HAR Dataset/SummarizedData.csv`.
* A second independent tidy data set is created with the average of each variable for each activity and each subject and it is exported to `~~/UCI HAR Dataset/TidyData_persubject.csv`.
