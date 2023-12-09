CodeBook
================

``` r
knitr::opts_chunk$set(echo = FALSE)

# A code book that describes the variables, the data, and any transformations or work that were performed to clean up the data
```

## Load

``` r
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
```

## Run Script

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
