library(dplyr)


#-----Create data file it doesnt exist already-----------#

  if(!file.exists("data")){  
      dir.create("data")       
  }

#---Download data file----#

  if(!file.exists("./data/UCI HAR Dataset")){  
      print ("data will be downloaded and unzipped into your data folder")
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, destfile = "./data/accelerometers.zip")  

    #--Record when file is downloaded--#
      dateDownloaded <- date()

    #---Unzip the file---------#
      unzip("./data/accelerometers.zip", exdir = "./data", unzip = "internal")
    }

  # designate folders with data files
    data_folder <- "./data/UCI HAR Dataset"
    test_folder <- paste(data_folder, "test", sep = "/" )
    train_folder <- paste(data_folder, "train", sep = "/")

  #-----Read in the txt files----------#

    # Features names
      features <- read.table(paste(data_folder, "features.txt", sep = "/"))
      feature_names <- as.character(features[,"V2"])
      feature_names <- sub("\\()","",feature_names)  # get rid of parenthesis
      feature_names
   
    # test set files
      x_test <- read.table(paste(test_folder, "X_test.txt", sep = "/"),   # contains data
                           col.names = feature_names)       
      y_test <- read.table(paste(test_folder, "y_test.txt", sep = "/"),   # activity labels
                           col.names = "activity")  
      subject_test <- read.table(paste(test_folder, "subject_test.txt",   # subject labels
                            sep = "/") ,col.names = "subject")  
 
    # train set files
      x_train <- read.table(paste(train_folder, "X_train.txt", sep = "/"), 
                            col.names = feature_names)
      y_train <- read.table(paste(train_folder, "y_train.txt", sep = "/"), 
                            col.names = "activity")
      subject_train <- read.table(paste(train_folder, "subject_train.txt", 
                            sep = "/"), col.names = "subject")

  #--------Merge Data Sets together----------------#
    test_set <- cbind(subject_test, y_test, x_test)   
    train_set <- cbind(subject_train, y_train, x_train)
    master_set <- rbind(test_set, train_set) # final merge of all data
  
      # subset dat to only include mean and std values
          dat_subset <- master_set[ , c(1:2,grep(( "mean|std"),colnames(master_set)))]

    #----Re-code activities to be descriptive-------#
       
      activity_label <- read.table(paste(data_folder, "activity_labels.txt",  # Grab acivity labels from data folder
                                         sep = "/"))
      activity <- tolower(as.vector(activity_label[,2]))  # convert labels to vector and in lowercase
      dat_subset$activity <- factor(dat_subset$activity, labels = activity)   # apply labels to factor variables 
      
  
      #---Get average of each variable for each activity and each subject

        dat_subset_tbl <- tbl_df(dat_subset) # convert dataframe to data frame tbl useable by dplyr package
        dat_subset_tbl
  
        dat_group <- group_by(dat_subset_tbl, subject,activity)  # groups data by subject and activity
 
        dat_means <- dat_group %>% summarise_each_(funs(mean), # takes the mean for each column using the grouping factors
                                        names(dat_group))
 

        #-----Write the final tidy data set into the data folder
          write.table(dat_means, file = "./data/UCI_HAR_activity_means.txt", row.names=FALSE)



