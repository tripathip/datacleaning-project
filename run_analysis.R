packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./Dataset.zip")
#unzipping the file
unzip("Dataset.zip")
#reading test, train, feature, and activity data files.
XTest<- read.table("UCI HAR Dataset\\test\\X_test.txt")
YTest<- read.table("UCI HAR Dataset\\test\\Y_test.txt")
SubjectTest <-read.table("UCI HAR Dataset\\test\\subject_test.txt")
XTrain<- read.table("UCI HAR Dataset\\train\\X_train.txt")
YTrain<- read.table("UCI HAR Dataset\\train\\Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset\\train\\subject_train.txt")
features<-read.table("UCI HAR Dataset\\features.txt")
activity<-read.table("UCI HAR Dataset\\activity_labels.txt")
#merges train and test data in one dataset (full dataset at the end)
X<-rbind(XTest, XTrain)
Y<-rbind(YTest, YTrain)
Subject<-rbind(SubjectTest, SubjectTrain)
#Dimension of new datasets
dim(X)
dim(Y)
dim(Subject)

#Part II
#Extracts only the measurements on the mean and standard deviation for each measurement.
#getting features indeces which contain mean() and std() in their name
index<-grep("mean\\(\\)|std\\(\\)", features[,2])
#counting the feature
length(index)
# getting only variables with mean/stdev
X<-X[,index]
# checking dim of subset
dim(X)
#Part III
#Uses descriptive activity names to name the activities in the data set
# replacing numeric values with lookup value from activity.txt; won't reorder Y set
Y[,1]<-activity[Y[,1],2]
head(Y)
#Part IV
#Appropriately labels the data set with descriptive variable names. 
names<-features[index,2]
# updating colNames for new dataset
names(X)<-names
names(Subject)<-"SubjectID"
names(Y)<-"Activity"
CleanedData<-cbind(Subject, Y, X)
#first 4 columns
head(CleanedData[,c(1:4)]) 

#PartV
CleanedData<-data.table(CleanedData)
# features average by Subject and by activity
TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity']
dim(TidyData)
#writing data on tidy.txt in the same directory D:\Work.
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)