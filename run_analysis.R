
  ## Course Project for 'Getting and Cleaning Data' (Coursera)
  
  ## It is assumed that the used data is available in the working directory.
  ## It should have 2 directories "train" and "test" with data and label files
  ## The working directory itself should contain "features.txt" and "activity_labels.txt"
  
  ## The libary "reshape2" is necessary to run this code
  
   
  ## step 1: read the files into tables
  train_x <- read.table("./train/X_train.txt") ## Train data set file
  test_x <- read.table("./test/X_test.txt") ##Test data set file
  train_y <- read.table("./train/y_train.txt") ## Train label file (label of activities by number)
  test_y <- read.table("./test/y_test.txt") ##Test label file (label of activities by number)
  Subject_test <- read.table("./test/subject_test.txt") ##subject ID file for test data set.
  Subject_train <- read.table("./train/subject_train.txt") ##Subject ID file for train data set.
  features <- read.table("./features.txt") ## List of all features
  activity_labels <- read.table("./activity_labels.txt") ## Links the class labels with their activity name.
  
  ## step 2: append test and train files and give columnNames
  
  Train_and_test_file <- rbind(train_x, test_x)
  colnames(Train_and_test_file) <- features$V2
  
  Train_and_test_labels <- rbind(train_y, test_y)
  colnames(Train_and_test_labels)<-"activity"
  
  Train_and_test_subjects <- rbind(Subject_train, Subject_test)
  
  ## step 3: select only mean and standard deviation from the dataset "Train_and_test_file"
  
  Train_and_test_mean_std <- Train_and_test_file[,grepl("mean\\(\\)|std\\(\\)",colnames(Train_and_test_file),ignore.case=TRUE)]
 
  ## step 4: substitute activitynumbers with activitynames from the file "activity_labels"
  
  Train_and_test_labels <- factor(Train_and_test_labels$activity, levels = activity_labels[,1] , labels = activity_labels[,2])
   
  ## step 5: merge subject and activity data with the mean and standard deviation data to one dataset and give columnames
  
  Total_dataset <- cbind(Train_and_test_subjects,Train_and_test_labels,Train_and_test_mean_std)
  colnames(Total_dataset) <-c("subject","activity", colnames(Train_and_test_mean_std))
  
  ## step 6: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  require(reshape2)
  tempdata<-melt(Total_dataset,id =c("subject","activity"), na.rm = TRUE )
  Tidy_dataset<-dcast(tempdata, subject + activity ~ variable, mean)
  
  ## step 7: Write tidy dataset in a file
  write.table(Tidy_dataset, file = "./tidy_data.txt",sep='\t',row.names=FALSE)

  
