##Reading test results
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
##Reading activity labels for test results
test_labels<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names="Act_Label")
##Reading IDs of test subjects
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="Subject")
##Merging data for test results
test_data<-cbind(test_subject,test_labels,test)

## Reading training results
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
## Reading activity labels for training results
train_labels<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names="Act_Label")
##Reading IDs of training subjects
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="Subject")
##Merging data for training results
train_data<-cbind(train_subject,train_labels,train)

## Merging test and train together
data<-rbind(test_data,train_data)

## Reading names of measurments (features)
features<-read.table("./UCI HAR Dataset/features.txt")
## Searching for measurments responsible for mean and standard deviation
matching<-grepl("mean()",features[,2])|grepl("std()",features[,2])
## Extracting matching measurment names as vector to use it as column names
## for merged dataframe after filtering
colnames<-as.vector(features[matching,2])

## Extracting from merged dataframe only the measurements on the mean and standard deviation
## Measurment columns start from 4th column
## for not to lose first two columns (Subject,Act_Label) we explicitly write them to TRUE
data_mean_std<-data[,c(TRUE,TRUE,matching)]

## Adding descriptive activity names to name the activities in the data set
## 1.Reading table with description of activity by activity label
activity_names<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_names)<-c("Act_Label","Activity")   ##Changing column names
## 2.Merging activity names and filtered dataset together
data_mean_std<-merge(activity_names,data_mean_std,by.x="Act_Label",by.y="Act_Label",All=FALSE)

## Changing column names for merged dataframe
names(data_mean_std)<-c("Act_Label","Activity","Subject",colnames)

##Creating new tidy dataset
tidy_data<-summarise_each(group_by(data_mean_std,Activity,Subject),funs(mean))
