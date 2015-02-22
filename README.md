# Getting_Data_Project
This is the course project for the Coursera Getting Data Course 

## Overview
Read in text files containing data and combine them to create tidy data then use this data to summarise any means and standard deviation columns by activity by subject

###Files
There are 3 data files each for the test and train data (X,y,activity) and the features and subject files
The x file contains the data gathered from the accelerometers and the means adn standard deviations of this data. The y file contains the id of the subject who was performing the activity and the activity file contains the activity code (1:6)

The features file contains the column headings for the x files. The activity file contains the activity code and the name of the corresponding activity.

###Scope
This project reads in the files above and outputs a summary_file.txt which contains the means of the means and stds. For this project I am assuming that any column heading that contains "mean" or "std" needs to be averaged 

###File locations
All files are assummed to be in the working directory. The summary_file.txt will also be output to the working directory


##Method

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
