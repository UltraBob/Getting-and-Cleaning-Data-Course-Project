# This project

This project examines readings taken from the sensors on a Samsung Galazy smartphone during 6 different activities.  The data was divided randomly into a training set consisting of 70% of the subject and a test set consisting of the other 30%.  For our purposes, this division was not necessary so data was combined into one larger set.  

I manipulated the data into to different data frames, one called meanstddata and the other called meansForActivitySubjectPairs.

The meanstddata data frame includes only the data representing standard deviation and mean calculations on the different sensor readings.

The meansForActivitySubjectPairs data frame provides a mean calculation for every measurement per Activity/Subject pair.  (e.g. a mean has been calculated for all 561 measurements provided when Subject 2 was Walking)

run_analytics.R expects that the initial data will be in a folder called UCI HAR Dataset in the working directory or it will downlaod and extract there.  It will then perform all the steps required to get from the raw data to the two tidy data sets.  It writes the meanstddata data frame to a text file called meanstddata.txt in the working directory.

## Study Design

For details on the design of this study I provide an excerpt of the README.txt file located in the UCI HAR Dataset folder.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Code Book

The variables included in the raw data are a subset of those described in the features_info.txt file in the UCI HAR Dataset folder.  Please find an excerpt describing those variables below:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
>
The set of variables that were estimated from these signals are: 
>
> mean(): Mean value
std(): Standard deviation

The meansForActivitySubjectPair data frame reuses the names of the measures listed in the features\_info.txt file, but actually represents an average of all values provided for the measurement in question for each Activity/Subject combination.  In addition to the set of variables estimated from the signals descibed above are these (also excerted from features_info.txt):

> mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

As an example, the column tBodyAcc-mad()-X in the row containing Activity LAYING and Subject 1 represents the mean of all the median X Accelerometer measurements recorded for Subject 1 while they were performing the LAYING activity.
