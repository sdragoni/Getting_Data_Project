run_analysis <- function(){
 
      library(dplyr)
      
      ### File List
      featuresfile <- "features.txt"
      activity_labelsfile <- "activity_labels.txt"

      subtestfile <- "subject_test.txt"
      Xtestfile <- "X_test.txt"
      ytestfilet <- "y_test.txt"

      subtrainfile <- "subject_train.txt"
      Xtrainfile <- "X_train.txt"
      ytrainfilet <- "y_train.txt"
      
      ### Import the files
      subject_train <- read.table(subtrainfile, header = FALSE)
      X_train <- read.table(Xtrainfile, header = FALSE)
      y_train <- read.table(ytrainfilet, header = FALSE)
      
      subject_test <- read.table(subtestfile, header = FALSE)
      X_test <- read.table(Xtestfile, header = FALSE)
      y_test <- read.table(ytestfilet, header = FALSE)

      headings <- read.table(featuresfile, header = FALSE)
      activities <- read.table(activity_labelsfile, header = FALSE)
   
      ### Clean up the headings (remove () change -, to . and change to lower case) and generate list of cleaned headings
      heading <- headings[,2]
      heading <- tolower(heading)
      heading <- gsub("\\(","",heading)
      heading <- gsub("\\)","",heading)
      heading <- gsub("\\,",".",heading)
      heading <- gsub("-",".",heading)
 
	  ### Build a list of the colums with mean or std included in their names
      head_use <- grepl("[Mm]ean|std",heading)
      head_list <- c("subject", "activity", heading[head_use])
      head_data <- c( heading[head_use])
      
	  ### Add the headings to the data frames 
      colnames(activities) <- c("activitycode", "activity")
   
      colnames(X_test) <- heading
      colnames(subject_test) <- "subject"
      colnames(y_test) <- "activitycode"
   
      colnames(X_train) <- heading
      colnames(subject_train) <- "subject"
      colnames(y_train) <- "activitycode"
  
	  ### add a column to the activity data frames and match the activity description to the code
      y_test$activity <- activities$activity[match(y_test$activitycode,activities$activitycode)]
      y_train$activity <- activities$activity[match(y_train$activitycode,activities$activitycode)]
   
	  ### Combine the X_train, y_train and subject_train data frames. Only combining the X_train columns which are mean or std (this is in head_use) then rename the columns
	  train_data <- cbind(subject_train,y_train$activity,X_train[,head_use])
      colnames(train_data) <- head_list
      
	  ### Combine the X_test, y_test and subject_test data frames. Only combining the X_test columns which are mean or std (this is in head_use) then rename the columns
	  test_data <- cbind(subject_test,y_test$activity,X_test[,head_use])
      colnames(test_data) <- head_list

	  ### Combine the train_data and test_data into all_data
      all_data <- rbind(train_data, test_data)

	  ### Pass all_data into group_by function to group by activityand subject then pass these groups to summarise_each which applied the mean function
      summ_data <- all_data %>% group_by(activity, subject) %>% summarise_each(funs(mean))
 
	  ### Output the summary data
      write.table(summ_data, "summary_file.txt", row.name=FALSE)
  
      
}
