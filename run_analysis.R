# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 

library(dplyr) #load library to be used
library(tidyr)

# load raw data to be used for tidying up
# X_train, y_train, subject_train are 561-length feature vectors, output labels (6 activity types), and subject number (1-30), respectively in the training dataset

X_train<-read.table("./train/X_train.txt") 
y_train<-read.table("./train/y_train.txt")
subject_train<-read.table("./train/subject_train.txt")

# ditto, but in the test dataset

X_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")
subject_test<-read.table("./test/subject_test.txt")

# load 561 feature names and 6 activity labels into character vectors so we can rename the variables later

feature_names<-readLines("./features.txt") 
activity_labels<-readLines("./activity_labels.txt")

# extract only the variables that contain the string "mean()" and "std()"

extract_index_mean<-grep("\\bmean\\(\\)", feature_names) 
extract_index_std<-grep("\\bstd\\(\\)", feature_names)
feature_names_trim<-feature_names[c(extract_index_mean, extract_index_std)] # check if the correct columns were selected

X_train_trim<-X_train %>% 
  select(c(all_of(extract_index_mean), all_of(extract_index_std))) #trim 561-vector train set to mean/std data only
X_test_trim<-X_test %>% 
  select(c(all_of(extract_index_mean), all_of(extract_index_std))) #ditto for test set

train_dataset<-cbind(subject_train, X_train_trim, y_train) #horizontally combine to create train dataset
test_dataset<-cbind(subject_test, X_test_trim, y_test) 
full_dataset<-rbind(train_dataset, test_dataset) #vertically combine to create full dataset

# Uses descriptive activity names to name the activities in the data set

full_dataset[,1]<-as.factor(full_dataset[,1]) #factorize subject & activity level for grouping later
full_dataset[,68]<-as.factor(full_dataset[,68])

levels(full_dataset[,68]) <- activity_labels #rename factor levels

# Appropriately labels the data set with descriptive variable names. 

column_names<-c("subject", feature_names_trim, "activity_label") #concatenate columns into character vector
colnames(full_dataset) <- column_names #rename columns

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dataset<-full_dataset %>% 
  group_by(subject, activity_label) %>% 
  summarize(across(where(is.numeric), mean)) #automatically select all columns that are numeric to get average

write.table(tidy_dataset, file = "./tidy_dataset.txt", row.names = FALSE)
