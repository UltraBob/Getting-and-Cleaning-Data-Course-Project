#Set paths and file names for datasets
testPath <- "UCI HAR Dataset/test/"
trainPath <- "UCI HAR Dataset/train/"
testLabels <- "y_test.txt"
testData <- "x_test.txt"
testSubject <- "subject_test.txt"
trainLabels <- "y_train.txt"
trainData <- "x_train.txt"
trainSubject <- "subject_train.txt"

#read in the files for the two datasets and combine them
testLabels <- read.table(paste(testPath,testLabels, sep=""))
testSubjects<- read.table(paste(testPath,testSubject, sep=""))
testData <- cbind(testLabels, testSubjects, read.table(paste(testPath, testData, sep="")))
trainLabels <- read.table(paste(trainPath, trainLabels, sep=""))
trainSubjects <- read.table(paste(trainPath, trainSubject, sep=""))
trainData <- cbind(trainLabels, trainSubjects, read.table(paste(trainPath, trainData, sep="")))

#combine the two datasets
data <- rbind(testData, trainData)

#read in the activity and variable names
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
columnNames <- read.table("UCI HAR Dataset/features.txt")

#Assign column names and Activity Names
colnames(data) <- c("Activity","Subject",as.character(columnNames[,2]))
data$Activity <- activityLabels[data[,"Activity"],"V2"]

#trim the dataset down to Activity, Subject and the mean and standard deviation measurements
meanstddata <- data[,c("Activity","Subject",colnames(data[grep('(mean|std)\\(\\)',colnames(data), perl=TRUE)]))]

#write the data to a text file
write.table(meanstddata, file="meanstddata.txt", row.name=FALSE)

# Create a second mutated dataset showing the averages of each type of measurement for each Activity/Subject pair
meltedData <- melt(data,id=names(data)[1:2],measure.vars=names(data)[3:ncol(data)])
meansForActivitySubjectPairs <- dcast(meltedData, Activity+Subject ~ variable, mean)