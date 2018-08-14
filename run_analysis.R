

##set work directory
setwd("~")

# Download and extract data

zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zip_url, "dataset.zip")
unzip("dataset.zip")



###Load train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")

###load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")

##copmpound test and train data
subject<-rbind(subject_test,subject_train)
y<-rbind(y_test,y_train)
x<-rbind(X_test,X_train)

##clear memomory
rm("X_train","y_train","subject_train","X_test","y_test","subject_test")

##Loading activity labels and feautures
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")

features <- read.table("UCI HAR Dataset/features.txt", quote="\"", comment.char="")

##filter features by mean and std
filter<-features[grep("mean|std",features[,2]),]
rm("features")

## filtering columns x dataset
x<-x[,filter[,1]]

##naming columns x dataset

names(x)<-filter[,2]


##create activity vector y with activity names

y<-as.data.frame(as.character(activity_labels[y[,1],2]))

##naming cols activity and subject
colnames(y)<-"activity"
colnames(subject)<-"subject"

##create tidy data set

tdata<-cbind(subject,y,x)

##clear unusable variables
rm("activity_labels","filter","subject","x","y","zip_url")


## write tidy data set
write.table(tdata, "tdata.txt", row.name=FALSE)


## create tidy data set with average values by activity and subject
average.tdata <- aggregate(tdata, by=list( subject=tdata$subject, activity=tdata$activity), FUN=mean)
average.tdata <- average.tdata[, -(3:4)]


##write average tidy data set

write.table(average.tdata, "average.tdata.txt", row.name=FALSE)











