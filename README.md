
Data Cleanup and analysis of data obtained from the:
Human Activity Recognition Using Smartphones Dataset Version 1.0
==================================================================

Completed for Cousera's Getting and Cleaning Data
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
---------------------------------------------------------


Summary of data collection from data README:
------------------------------------------------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 
19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data. 


**In order to execute this script you need to have the dplyr package installed**


DATA acquisition and loading
------------------------------

1. The input and output data are loaded into the data folder in your working directory.	If you do you not have one already it will be created.

2. The script downloads and unzips the data files if you do not have the file in your working directory.
			** If you already have the file downloaded make sure the folder of the original
			data set is unchanged ("UCI HAR Dataset") and is located in the 'data' folder.**

		Paths to the data files are designated with the data_folder, test_folder and 
		train_folder variables.  

		The feature names are loaded from the features.txt file, cleaned and saved to the 
		variable feature_names.  These will be the column names for the data files (X_test and X_train).
		
		The test set files and train set files are loaded which include data files, subject 
		numbers, and activity numbers.
		
		The inertial signals folders were not included in this analysis. 
	
	DATA merging
	==============
		
		Since the subjects were split up between the two set of files the test files and 
		train files were merged separately at first and then merged together to form the 
		master set. The column containing subject numbers is named "subject" and the 
		column containing activity numbers is named "activity".
		
		**Overview of data structure**
		
					Master Data frame
		-------------------------------------------
		test files 					train files
		--------------				------------
		subject_test.txt 			subject_train.txt		# contains subject numbers (30 unique values)
		y_test.txt					y_train.txt				# contains activity numbers (6 unique values)
		X_test.txt					X_train.txt				# contains data points for each variable


	DATA Subsetting and Cleanup
	============================
	
		Data is subsetted to include variables (columns) that contain values for mean
		and standard errors.  
		
		Activity labels are grabbed from the activity_labels.txt file and stored in a 
		vector in lowercase letters.
		
		The numbers in the activity column are replaced by their corresponding activity 
		(eg. 5 = sitting, so all 5's are replaced by the string "sitting)
		
	Summarizing DATA and Final File creation
	==========================================
	
		The dataframe is converted into a table that is usable by the dplyr package for
		easy grouping and data summary.
		
		The data is then grouped by the subject and the activity variables (columns).
		
		The summarise_each_ function in plyr is used to take the mean of each variable
		for each activity and each subject.
		
		The final table created is written to a file called "UCI_HAR_activity_means.txt"
		in the data folder.
		
		