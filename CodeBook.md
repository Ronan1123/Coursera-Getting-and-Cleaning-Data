---
title: "CodeBook"
author: "Ronan1123"
date: "22 August 2015"
output: html_document
---

# Code Book for Coursera Getting and Cleaning Data Course Project

This is the code book for the Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# Description of the Data

The dataset includes the following files:

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. An equivalent file exists for subject test data

Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.


# Description of Transformations applied to generate the Data

We created one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each   measurement.

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names.

* From the data set that resulted we created a second, independent tidy data set with the average of each variable for each activity and each subject.

# Description of Variables in the Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ

* tGravityAcc-XYZ

* tBodyAccJerk-XYZ

* tBodyGyro-XYZ

* tBodyGyroJerk-XYZ

* tBodyAccMag

* tGravityAccMag


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals

* tBodyAccJerkMag

* tBodyGyroMag

* tBodyGyroJerkMag


Finally a Fast Fourier Transform (FFT) was applied to some of these signals

* fBodyAcc-XYZ

* fBodyAccJerk-XYZ

* fBodyGyro-XYZ

* fBodyAccMag

* fBodyAccJerkMag

* fBodyGyroMag

* fBodyGyroJerkMag


The set of variables that were estimated from these signals are: 

* mean(): Mean value

* std(): Standard deviation

* mad(): Median absolute deviation

* max(): Largest value in array

* min(): Smallest value in array

* sma(): Signal magnitude area

* energy(): Energy measure. Sum of the squares divided by the number of values.

* iqr(): Interquartile range

* entropy(): Signal entropy

* arCoeff(): Autorregresion coefficients with Burg order equal to 4

* correlation(): correlation coefficient between two signals

* maxInds(): index of the frequency component with largest magnitude

* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

* skewness(): skewness of the frequency domain signal 

* kurtosis(): kurtosis of the frequency domain signal 

* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

* angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean

* tBodyAccMean

* tBodyAccJerkMean

* tBodyGyroMean

* tBodyGyroJerkMean

