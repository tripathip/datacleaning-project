#Title: Getting and CLeaning Data Project readme.md file
###Part I - 
######loading packages data.table and reshape2
######downloading the zip file in working directory
######It then unzips the file and reads test, train, feature, and activity data files and creating following datasets.
1. XTest 
2. YTest
3. SubjectTest
4. XTrain
5. YTrain
6. SubjectTrain
7. features
8. activity
######It then merges train and test data in one dataset (full dataset at the end) and also looking dimensions for merged data.

###Part II - Extracts only the measurements on the mean and standard deviation for each measurement.
######getting features indeces which contain mean() and std() in their name
######Then it counts the feature
######It gets only variables with mean/stdev & checking dim of subset

###Part III - Uses descriptive activity names to name the activities in the data set
######It replaces numeric values with lookup value from activity.txt

###Part IV
######Appropriately labels the data set with descriptive variable names & updates colNames for new dataset

###PartV - features average by Subject and by activity.
######writing data on tidy.txt in the working directory.
