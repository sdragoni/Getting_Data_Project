# Getting_Data_Project
This is the course project for the Coursera Getting Data Course 

Method

Define the inportt files (3 train, 3 test, the features and activity labels)
Import the files
Clean up the headings (get rid of () and replace commas and dashes with dots ) 
Identify the columns which contain means or stds
Match the activities to the y_test/y_train dfs
Set the column names for the X_test/X_train data frames (from the features)
Bind together the test dataframes into df test, only loading in the x_test columns which are means or stds - using cbind
Bind together the train dataframes into df train, only loading in the x_train columns which are means or stds - using cbind
Bind together the train and test dfs called alldata - using rbind

Summarise the alldata df by activity and subject calculating the mean of all the other columns
Export the summary file 
