# This project

This project examines readings taken from the sensors on a Samsung Galazy smartphone during 6 different activities.  The data was divided randomly into a training set consisting of 70% of the subject and a test set consisting of the other 30%.  For our purposes, this division was not necessary so data was combined into one larger set.  

I manipulated the data into to different data frames, one called meanstddata and the other called meansForActivitySubjectPairs.

The meanstddata data frame includes only the data representing standard deviation and mean calculations on the different sensor readings.

The meansForActivitySubjectPairs data frame provides a mean calculation for every measurement per Activity/Subject pair.  (e.g. a mean has been calculated for all 561 measurements provided when Subject 2 was Walking)

run_analytics.R requires that the initial data be in a folder called UCI HAR Dataset in the working directory to operate properly, but if this requirement is met, it will perform all the steps required to get from the raw data to the two tidy data sets.  It writes the meanstddata data frame to a text file called meanstddata.txt in the working directory.

## Study Design

For details on the design of this study I direct you to the README.txt file located in the UCI HAR Dataset folder.

## Code Book

The details of the variables included in the raw data please see the features_info.txt file in the UCI HAR Dataset folder.  Our first data frame deals entirely with the mean and standard deviation varieties of the variables listed therein.

The meansForActivitySubjectPair data frame resuses the names of the measures listed in the features_info.txt file, but actually represents an average of all values provided for the measurement in question for each Activity/Subject combination.  