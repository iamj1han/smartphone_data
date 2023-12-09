CodeBook
================

## Objectives

``` r
# Getting and Cleaning Data Course Project

# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 

# This code book describes the variables, the data, and any transformations or work that were performed to clean up the data
```

## Files, Data, Variable

``` r
# Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (already downloaded and unzipped in this repository)

# ./test: folder that contains raw test data
# ./train: folder that contains raw training data
# ./features.txt: feature names
# ./features_info.txt: feature detailed information (not used in the analysis)
# ./activity_labels.txt: activity labels
# ./CodeBook.md: knitted version of CodeBook.Rmd
# ./CodeBook.Rmd: codebook that describes the variables, the data, and any transformations or work that were performed to clean up the data
# ./run_analysis.R: a script performing the tidying up
# ./tidy_dataset.txt: output of the tidying up

# Dataset Information

# The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# For each record in the dataset it is provided:

# - A 561-feature vector with time and frequency domain variables. 
# - Its activity label. 
# - An identifier of the subject who carried out the experiment. 
```

## Script and Output

``` r
# input: X_train, y_train, subject_train, X_test, y_test, subject_test, feature_names, activity_labels loaded from above.
# output: tidy_dataset.txt that containes average of each variable grouped by subject number (1-30) and activity type (1-6), i.e. 180 groups

source("./run_analysis.R")
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## `summarise()` has grouped output by 'subject'. You can override using the
    ## `.groups` argument.
