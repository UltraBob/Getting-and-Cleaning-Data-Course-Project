#Getting and Cleaning Data Coursera Course Project

Run the *run_analysis.R* script included in the root of this project.  If the dataset is not already extracted into a directory called UCI HAR Dataset, the script downloads and extracts the data.  It then recreates all steps used to create the two tidy data sets for ths course project.  The run_analysis script is pretty well commented, but I'll recap here:

0. If the UCI HAR Dataset doesn't exist, download the dataset and extract it there.
1. Setting variables to represent the path to the test and train data sets, and the filenames for the files containing the necessary data
2. Those data sets are then read into R and combined into one larger dataset
3. labels for the different measurements and the names of the activities are brought in from the files containing that data and added to the data frame
4. Here we start to differentiate the first of the two data sets; a new data frame is created including only the measurement data representing mean and standard deviation calculations
5. this first data set is then written into the meanstddata.txt file in the workign directory
6. We then differentiate a second data set by sorting the data into Activity/Subject pairs anf providing a mean calculation for all 561 variables in the data, associated with each pair
