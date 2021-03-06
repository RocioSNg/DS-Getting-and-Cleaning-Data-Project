CODE BOOK
==============
Data Cleanup and analysis of data obtained from the: Human Activity Recognition Using Smartphones Dataset Version 1.0
----------------------------------------------------------------------------------------------------------------------

**Summary of data collection from data README:**

'''
The experiments have been carried out with a group of 30 volunteers within an age bracket of 
19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. 
'''

###Overview of tidy data set:

1. The tidy data set is in wide format.

2. The first column is named "subject" and contains numbers for each subject (30 in total).  

3. The second column is name "activity" and are named as so in the data set:
  	
- walking
- walking_upstairs
- walking_downstairs
- sitting
- standing
- laying
 

###Description of Data Variables (obtained from README file included with data set)

1. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order 
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

2. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

3. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

####These signals were used to estimate variables of the feature vector for each pattern:  

**'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.**

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

####The set of variables that were estimated from these signals and kept in the dataset are: 

- **mean: Mean value**
- **std: Standard deviation**

#####The means of each variable(its mean and std deviation) is calculated and reported for each subject(in column 1)  and each activity (in column 2).