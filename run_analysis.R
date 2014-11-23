library(plyr)
library(dplyr)


#-----Create data file it doesnt exist already-----------#

  if(!file.exists("data")){  
    dir.create("data")       
  }


#---Download data file----#
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile = "./data/accelerometers.zip")  

#--Record when file is downloaded--#
  dateDownloaded <- date()

#---Unzip the file---------#
  unzip("./data/accelerometers.zip", exdir = "./data", unzip = "internal")

  # designate folders with data files
    data_folder <- "./UCI HAR Dataset"
    test_folder <- paste(data_folder, "test", sep = "/" )
    train_folder <- paste(data_folder, "train", sep = "/")

  #-----Read in the txt files----------#

    # Features names
      features <- read.table(paste(data_folder, "features.txt", sep = "/"))
      head(features)
      feature_names <- as.character(features[,"V2"])
      for (name in feature_names){
        if (name[1] == t){
          feature_names <- sub("\\()","",feature_names)  # get rid of parenthesis
        }
      

 
    
    # test set 
      x_test <- read.table(paste(test_folder, "X_test.txt", sep = "/"), 
                           col.names = feature_names  )   # contains data
        head(x_test)
        dim(x_test)
      y_test <- read.table(paste(test_folder, "y_test.txt", sep = "/"), col.names = "activity")  # activity labels
        head(y_test)
        dim(y_test)
      subject_test <- read.table(paste(test_folder, "subject_test.txt", sep = "/") ,col.names = "subject")  # subject labels
        head(subject_test)
        dim(subject_test)

    # train set
      x_train <- read.table(paste(train_folder, "X_train.txt", sep = "/"), col.names = feature_names)
      dim(x_train)
      y_train <- read.table(paste(train_folder, "y_train.txt", sep = "/"), col.names = "activity")
      dim(y_train)
      subject_train <- read.table(paste(train_folder, "subject_train.txt", sep = "/"), col.names = "subject")

  # merge test data files together
    test_set <- cbind(subject_test, y_test, x_test)

  # merge training set together
    train_set <- cbind(subject_train, y_train, x_train)

  #-----Make final Merge
    master_set <- rbind(test_set, train_set) 
  
    # subset dat to only include mean and std values
      dat_subset <- master_set[ ,  c( 1:2,grep(( "mean|std"),colnames(master_set))) ]

    #----Recode acitvities to be descriptive
  
      # Grab acivity labels from data folder
      activity_label <- read.table(paste(data_folder, "activity_labels.txt", sep = "/"))
      activity <- as.vector(activity_label[,2])
    
      dat_subset$activity <- factor(dat_subset$activity, labels = activity)
      dat_subset$subject <- NULL  # remove subject column since it is not needed
  
      # convert dataframe to data frame tbl useable by dplyr package
      dat_subset_tbl <- tbl_df(dat_subset)
      dat_subset_tbl
  
      dat_by_activity <- group_by(dat_subset_tbl, activity)
 
      dat_means <- dat_by_activity %>% summarise_each_(funs(mean), names(dat_by_activity))
  

