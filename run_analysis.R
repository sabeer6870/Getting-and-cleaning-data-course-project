#step 1
#read files from training and test data
#test data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
#training data
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
#merge training and test data
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_test,subject_train)
#step 2
#read column name and extraction
features <- read.table("features.txt")
colmeansum <- grep("-(mean|std)", features[, 2])
x_data <- x_data[,colmeansum]
names(x_data) <- features[colmeansum,2]
#step 3
#Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
y_data[, 1] <- activity[y_data[, 1], 2]
names(y_data) <- "activity"
final_data <- cbind(x_data, y_data, subject_data)
#step 4
names(subject_data) <- "subject"
alldata <- cbind(x_data, y_data, subject_data)
#step 5
library(plyr)
averages_data <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
