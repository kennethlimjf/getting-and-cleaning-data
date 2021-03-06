# Code Book
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Data Source
* Original data: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Original description of the dataset: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Data Preparation

### Preparing the subject data
***subject (data)***. Read `subject_train.txt` and `subject_test.txt`, then use `rbind` to append the rows.

### Preparing the activity data
***Activity Labels***. Read `activity_labels.txt`. This contains the mapping for activity ID and the activity labels. Subset the activity label column from the result.

***y (data)***. Read `y_train.txt` and `y_test.txt`, and use `rbind` to append the rows.

***Joining***. Join the both y and activity with `join()` from the `plyr` package. By default, a left join is performed, so to perform a left join with `y` on the left, let `y` be the first argument. 

### Preparing the main data

***Features***. Read `features.txt`. This contains the features labels.
Subset only the labels that contain `mean` or `std`, and assign to `selectCols`.

***Column Names***. Create a variable `featureColNames` to prepare the columns names. The column names have `()` removed for more meaningful names.

***X (data)***. Read `X_train.txt` and `X_test.txt` and use `rbind` to append the rows.

### Combined data set
***data (data)***. Column bind `subject`, `y`, `X` using `cbind(subject, y, X)`.

***column names***. The column names are set for `data`: 
`columnNames = c("subject", "activity", featureColNames)`, 
`colnames(data) <- columnNames`

***tidyData (final data)***. Using the `dplyr` package, perform `group_by` subject and activity. This is piped into `summarise_each(funs(mean))` which will calculate a mean on each column, under the groups. The result is written to `tidyData.txt`.
