---
title: "ReadMe"
author: "Ronan1123"
date: "22 August 2015"
output: html_document
---

# ReadMe for Coursera Getting and Cleaning Data Course Project

This is the ReadMe file for the Human Activity Recognition Using Smartphones Dataset project.  For the Codebook please see the Codebook.md file that describes the data and the transformations that were applied.

# run_analysis.R file
I created one R script called run_analysis.R that does the following.

* Set the working directory to where the data is stored.

* Read in the datafiles

* Uses the features data to set the variable names in the X datasets

* Sets variable name to activity id or activity label in Y datasets and activity type datasets.

* Binds the test datasets; Bind the Y datasets; Bind the test and train datasets together

* Rename the numeric indicator in the activity_id variable to descriptive names

* only keep the variables that we need. Note that here I have interpreted "mean" and "standard deviation" to mean all variables that were mean or standard deviation measures which means it includes:

        + gravityMean

        + tBodyAccMean

        + tBodyAccJerkMean

        + tBodyGyroMean

        + tBodyGyroJerkMean


* From the data set that resulted I created a second, independent tidy data set with the average of each variable for each activity and each subject.

I wrote that tidy dataset using:
```{r, echo=FALSE}
write.table(tidy_data, file = "tidydata.txt", row.name = FALSE, sep = "\t")
```

Therefore this code should allow the user to read the data
```{r, echo=FALSE}
data <- read.table(file_path, header = TRUE, sep="\t")
```

with thanks to the thread here for much help and advice: https://class.coursera.org/getdata-031/forum/thread?thread_id=28
