
Data Cleanup and analysis of data obtained from the: Human Activity Recognition Using Smartphones Dataset Version 1.0
=======================================================================================================================
Completed for Cousera's Getting and Cleaning Data by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
----------------------------------------------------------------------------------------------------------

**In order to execute this script you need to have the dplyr package installed**


DATA acquisition and loading
------------------------------

1. The input and output data are loaded into the data folder in your working directory.	If you do you not have one already it will be created.

2. The script downloads and unzips the data files if you do not have the file in your working directory. **If you already have the file downloaded make sure the folder of the original data set is unchanged ("UCI HAR Dataset") and is located in the 'data' folder.**

3. Paths to the data files are designated with the data_folder, test_folder and train_folder variables.  

4. The feature names are loaded from the features.txt file, cleaned and saved to the variable feature_names.  These will be the column names for the data files (X_test and X_train).
		
5. The test set files and train set files are loaded which include data files, subject numbers, and activity numbers. The inertial signals folders were not included in this analysis. 
	
DATA merging
---------------
		
Since the subjects were split up between the two set of files the test files and train files were merged separately at first and then merged together to form the master set. The column containing subject numbers is named "subject" and the column containing activity numbers is named "activity".

**Overview of data structure**
		
				Master Data frame
	-------------------------------------------
	test files 					train files
	--------------				------------
	subject_test.txt 			subject_train.txt		# contains subject numbers (30 unique values)
	y_test.txt					y_train.txt				# contains activity numbers (6 unique values)
	X_test.txt					X_train.txt				# contains data points for each variable


DATA Subsetting and Cleanup
-----------------------------
	
1. Data is subsetted to include variables (columns) that contain values for mean and standard errors.  

2. Activity labels are grabbed from the activity_labels.txt file and stored in a vector in lowercase letters.
		
3. The numbers in the activity column are replaced by their corresponding activity 
..*(eg. 5 = sitting, so all 5's are replaced by the string "sitting)
		
Summarizing DATA and Final File creation
-----------------------------------------
	
1. The dataframe is converted into a table that is usable by the dplyr package for easy grouping and data summary.
		
2. The data is then grouped by the subject and the activity variables (columns).
		
3. The summarise_each_ function in plyr is used to take the mean of each variable for each activity and each subject.

4. The final table is written to a file called "UCI_HAR_activity_means.txt"	in the data folder.
		
		