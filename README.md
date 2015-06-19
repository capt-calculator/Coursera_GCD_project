## README for Coursera Getting and Cleaning Data course project.


This repo contains three files:

1. run_analysis.R  -  An R script for cleaning and preparing a new dataset based on the "Human Activity
   Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository. 
   
2. A codebook (codebook.txt) with definitions for all of the variables in the new dataset.

3. This README



run_analysis.R performs a number of steps to process the raw data files. First, the training features data set and 
the test features data set are loaded from the corresponding text files into data.frames. After that the subject id 
column in added to each, and the activity id column is added to each. 

The train and test data sets are then combined into one single data.frame. Then, the feature set is
given descriptive column names taken from the 'features.txt' file. In addition the subject and activity id columns are given
names. 

From there, the features that measure standard deviation and mean are extracted. Then the activity id column data
are converted from integers to their corresponding descriptive activity name, as indicated by the 'activity_labels.txt' included
in the original data set. 

Finally, the data is grouped by activity and then subject and summarized using the mean. This results in the 180 x 68 data.frame
submitted on Coursera.

**For additional documentation, see comments in run_analysis.R

