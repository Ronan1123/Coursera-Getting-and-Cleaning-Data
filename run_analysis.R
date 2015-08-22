################################################################################

## Coursera Getting and Cleaning Data Course Project
## Ronan Mulligan
## 21 August 2015

################################################################################
# Load the required libraries
library(reshape2)

# Set the working directory to where the data is stored
work_dir <- "C:/Users/User/DataScience/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
setwd(work_dir)

# Read in the datafiles
features        <- read.table('./features.txt',header=FALSE)
activity_type   <- read.table('./activity_labels.txt',header=FALSE) 
subject_train   <- read.table('./train/subject_train.txt',header=FALSE) 
x_train         <- read.table('./train/x_train.txt',header=FALSE)
y_train         <- read.table('./train/y_train.txt',header=FALSE)
subject_test    <- read.table('./test/subject_test.txt',header=FALSE) 
x_test          <- read.table('./test/x_test.txt',header=FALSE)
y_test          <- read.table('./test/y_test.txt',header=FALSE)

# Use the features data to set the variable names in the X datasets
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

# Set variable name to "subject" in the subject dataset
colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

# Set variable name to activity id or activity label in Y datasets and activity type datasets
colnames(y_test) <- "activity_id"
colnames(y_train) <- "activity_id"
colnames(activity_type) <- c("activity_id", "activity_label")

# Bind the test datasets; Bind the Y datasets; Bind the test and train datasets
alltestdata     <- cbind(subject_test, y_test, x_test)
alltraindata    <- cbind(subject_train, y_train, x_train)
alldata         <- rbind(alltestdata, alltraindata)

# Rename the numeric indicator in the activity_id variable to descriptive names
activity.names <- activity_type$activity_label
alldata$activity_id <- activity.names[alldata$activity_id]

# only keep the variables that we need
keepvars <- grepl("subject|activity_id|mean|std",colnames(alldata))
alldata <- alldata[,keepvars]

# tidy up the workspace, remove unwanted dataframes
rm(list=setdiff(ls(), c("alldata", "work_dir")))

# melt the data as a precursor to establishing the tidy dataset
melt_data <- melt(alldata, id = c("subject", "activity_id"))

# create tidydata set with mean of variables using dcast
tidy_data <- dcast(melt_data, subject + activity_id ~ variable, mean)

# write the tidy dataset to the working directory
write.table(tidy_data, file = "tidydata.txt", row.name = FALSE, sep = "\t")
