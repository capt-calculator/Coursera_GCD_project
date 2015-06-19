require(data.table)
require(dplyr)


## Read in the feature sets for the train and test data
X_test <- read.table('.\\test\\X_test.txt')
X_train <- read.table('.\\train\\X_train.txt')

## Read in the subject data for the train and test data
subject_test <- read.table('.\\test\\subject_test.txt')
subject_train <- read.table('.\\train\\subject_train.txt')

## Read in the y (activity) data for the train and test data
y_test <- read.table('.\\test\\y_test.txt')
y_train <- read.table('.\\train\\y_train.txt')

## Read in the feature names and make syntactically correct
feature_names <- read.table('features.txt')
feature_names <- feature_names[, 2]
feature_names <- make.names(feature_names)

## Read in the activity labels
activity_labels <- read.table('activity_labels.txt')
activity_labels <- activity_labels[, 2]

## Add subject and activity columns to train and test
X_test <- cbind(X_test, subject_test, y_test)
X_train <- cbind(X_train, subject_train, y_train)

## Combine train and test data into one dataset
full_data <- rbind(X_train, X_test)

## Replace default column names with feature_names
colnames(full_data) <- c(as.character(feature_names), "Subject", "Activity")

## There are repeated column names. Subet full_data to only unique column names
full_data <- full_data[, unique(colnames(full_data))]

## Extract only mean and standard deviation columns for each measurement
full_data <- select(
  full_data, 
  contains('.std'), 
  contains('.mean..'), 
  contains('Subject'), 
  contains('Activity')
  )


# Make the activity names descriptive, convert from numeric to corresponding activity from 'activity_labels.txt'
tidy <- mutate(full_data, Activity=activity_labels[Activity])

# Group the data by Activity and then Subject. Summarize each column using average
final <- tidy %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

