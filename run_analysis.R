library(plyr)
library(reshape2)

setwd("C:/Users/User/DataScience/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

features        <- read.table('./features.txt',header=FALSE)
activity_type   <- read.table('./activity_labels.txt',header=FALSE) 
subject_train   <- read.table('./train/subject_train.txt',header=FALSE) 
x_train         <- read.table('./train/x_train.txt',header=FALSE)
y_train         <- read.table('./train/y_train.txt',header=FALSE)
subject_test    <- read.table('./test/subject_test.txt',header=FALSE) 
x_test          <- read.table('./test/x_test.txt',header=FALSE)
y_test          <- read.table('./test/y_test.txt',header=FALSE)

colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

colnames(subject_test) <- "subject"
colnames(subject_train) <- "subject"

colnames(y_test) <- "activity_id"
colnames(y_train) <- "activity_id"
colnames(activity_type) <- c("activity_id", "activity_label")

alltestdata     <- cbind(subject_test, y_test, x_test)
alltraindata    <- cbind(subject_train, y_train, x_train)
alldata         <- rbind(alltestdata, alltraindata)

activity.names <- activity_type$activity_label
alldata$activity_id <- activity.names[alldata$activity_id]


keepvars <- grepl("subject|activity_id|mean|std",colnames(alldata))
alldata <- alldata[,keepvars]

rm(list=setdiff(ls(), "alldata"))

melt_data <- melt(data, id = id_labels, measure.vars = data_labels)

tidy_data <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

