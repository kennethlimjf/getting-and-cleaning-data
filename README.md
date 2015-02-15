# Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## How to setup and run the script

To prepare the script for running:

1. Download the original data set from:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Extract the data into the project root folder. Rename `UCI HAR Dataset` to `dataset`.
3. Open `run_analysis.R` in RStudio.
4. Modify the code to set the working directory to the project root directory

```r
# Set working directory
setwd("~/r_projects/getting_cleaning_data")   # Set Working Directory here
```

Once done, the script can be run on RStudio and it will generate the `tidyData.txt` file. If it fails, ensure you have installed the following packages:

* data.table
* plyr
* dplyr 
