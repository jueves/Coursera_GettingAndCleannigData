#Original data set
Data is get from experiments from the proyect *Human Activity Recognition Using Smartphones* carried by Non Linear Complex Systems Laboratory in Smartlab, Genova, Italy. It involves a series of activities performed by subjects while wearing a smartphone atached to their waist.
Data come from the phone accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, measured in `standar gravity units` for the acceleration and `radians per second` for the gyroscope.
You can find extended information about the dataset in [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#Data set variables
This dataset has 564 variables, 561 of which are properly described in the original file `~/UCI HAR Dataset/features_info.txt` downloaded and extracted by `run_analysis.R`.

The following additional variables have been added:

* To match each observation with the subject who performed it based on `~/UCI HAR Dataset/test/subject_test.txt` and `~/UCI HAR Dataset/train/subject_train.txt` a new variable _subject_ has been added to the dataset.

* To identify the original data set (_train_ or _test_) a new variable _set_ has been added.

* Finally, to match each observation with the activity the subject was performing an other variable named _activity_ was added to the dataset.

#Transformations made
The script `run_analysis.R` performs the following modifications over the original data.
* Data set variables labeled with descriptive names from `~/UCI HAR Dataset/features.txt`.
* Activities performed by subjects in each observation added to the dataset from `~/UCI HAR Dataset/test/y_test.txt` and `~/UCI HAR Dataset/train/y_train.txt` and descriptive activity names added from `~/UCI HAR Dataset/activity_labels.txt`.
* Training and test sets merged to create one data set called `mydata` and exported to `~/UCI HAR Dataset/TidyData_FULL.txt`.
* All variables from `mydata` containing mean or standard deviation measurements extracted to a new dataset called `mean_and_std`. This dataset was exported to `~/UCI HAR Dataset/Mean_and_std.txt`.
* A third data set called `mydata2` is created with the average of each variable from `mean_and_std` grouped by activity and subject. It was exported to `~/UCI HAR Dataset/Mean_and_std_grouped.txt`.