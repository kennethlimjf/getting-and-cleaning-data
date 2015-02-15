library(data.table)
library(plyr)
library(dplyr)

# Set working directory
setwd("~/r_projects/getting_cleaning_data")

# Join subject data
subjectTrain <- data.table(read.table("./dataset/train/subject_train.txt"))
subjectTest <- data.table(read.table("./dataset/test/subject_test.txt"))
subject <- rbind(subjectTrain, subjectTest)

# Prepare activity lables and join y data
activityLabel <- data.table(read.table("./dataset/activity_labels.txt"))
yTrain <- data.table(read.table("./dataset/train/y_train.txt"))
yTest <- data.table(read.table("./dataset/test/y_test.txt"))
y <- rbind(yTrain, yTest)
y <- join(y, activityLabel)[,V2]

# Prepare feature labels and join X data
features <- data.table(read.table("./dataset/features.txt"))
selectCols <- paste("V", sort(grep("mean|std", features$V2)), sep="")
featureColNames <- gsub("\\(\\)", "", as.character(features[sort(grep("mean|std", features$V2)), V2]))
XTrain <- data.table(read.table("./dataset/train/X_train.txt"))
XTest <- data.table(read.table("./dataset/test/X_test.txt"))
X <- rbind(XTrain, XTest)
X <- subset(X, select=selectCols)

# Join data and set column names
data <- cbind(subject, y, X)
columnNames = c("subject", "activity", featureColNames)
colnames(data) <- columnNames

# Group data by subject and activity and summarize by mean for each column, then order by subject, activity
tidyData <- data %>% group_by(subject, activity) %>%  summarise_each(funs(mean)) %>% arrange(subject, activity)
write.table(tidyData, file = "tidyData.txt", sep = ",", row.name=F)