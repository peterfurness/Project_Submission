## Getting and Cleaning Data - Course Project
## R-script created 22/11/2014

## Step 0 - download zip files and unzip---------------------------------------------

## NOTE: This step can be omitted if the working directory already contains the files 
## listed in the unzip commands below

## Download the following zip file and unzip
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile<-"dataset.zip"
download.file(fileUrl, destfile=zipfile)

## Now list out the contents of the zip file without extracting
t<-unzip(zipfile, list=TRUE)
t[,1]

## Now unzip the required files and copy into the working directory
file1<-"UCI HAR Dataset/train/X_train.txt"; file2<-"X_train.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/train/y_train.txt"; file2<-"y_train.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/test/X_test.txt"; file2<-"X_test.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/test/y_test.txt"; file2<-"y_test.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/train/subject_train.txt"; file2<-"subject_train.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/test/subject_test.txt"; file2<-"subject_test.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/features.txt"; file2<-"features.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)

file1<-"UCI HAR Dataset/activity_labels.txt"; file2<-"activity_labels.txt"
unzip(zipfile, file1 ); file.copy( file1, file2)


## Step 1 - read the training and test sets and features data into R --------
 
## First read the training sets X_train, Y_train and subject_train
## Note that 64-bit R was used for the following code as memory problems
## were encountered when using the 32-bit version.  If you only have the 32-bit
## version you may need to reduce the buffersize parameter in read.fwf to a
## lower value than its default value of 2000

width1<-rep(16, 561)
file<-"X_train.txt"
X_train<-read.fwf(file, width1)

file<-"y_train.txt"
## Note. These are the activity codes
Y_train<-read.fwf(file, 3)

file<-"subject_train.txt"
subject_train<-read.fwf(file, 3)

## Now read the test sets X_test, Y_test and subject_test

width1<-rep(16, 561)
file<-"X_test.txt"
X_test<-read.fwf(file, width1)

file<-"Y_test.txt"
## Note. These are the activity codes
Y_test<-read.fwf(file, 3)

file<-"subject_test.txt"
subject_test<-read.fwf(file, 3)

## Now read the features dataset and determine which features to keep, given that
## we are supposed to keep only the means and standard deviation measurements

file<-"features.txt"
features<-read.table(file, col.names=c("feature_num", "feature"))
library("stringr")
features_relevant<-subset(features, 
                          str_detect(feature,"mean")|
                          str_detect(feature,"Mean")|
                          str_detect(feature,"std")
                          )

## Step 2 - Selection of relevant feature variables and attachment of subject and activity codes

## First clean up the feature names so they can be used as valid variable names
## Note that brackets are reserved characters and you need to use escape \\
## when doing string substitutions of them, ditto for commas

library("dplyr")
f<-transmute(features_relevant, feature_num, 
             feature = str_replace_all(feature, "-", "_") )
f<-transmute(f, feature_num, 
             feature = str_replace_all(feature, "\\()", "") )
f<-transmute(f, feature_num, 
             feature = str_replace_all(feature, "\\(", "_") )
f<-transmute(f, feature_num, 
             feature = str_replace_all(feature, "\\)", "") )
f<-transmute(f, feature_num, 
             feature = str_replace_all(feature, "\\,", "_") )

## Extract only the relevant variables as held in the features dataset f
## Do this for the training and test sets
train<-X_train[, f$feature_num]
names(train)<-f$feature
test<-X_test[, f$feature_num]
names(test)<-f$feature


## Now merge in the subject and activity codes
## First for training set
train<-cbind(subject_train, Y_train,  train)
names(train)[1:2]<-c("subject", "activity")

## Now for test set
test<-cbind(subject_test, Y_test,  test)
names(test)[1:2]<-c("subject", "activity")

## Combine training and test sets
## need to edit this so that full datset included
combined_data<-rbind(train, test)

## now replace activity codes by descriptors

activity_name<-c("WALKING",
                 "WALKING_UPSTAIRS",
                 "WALKING_DOWNSTAIRS",
                 "SITTING", 
                 "STANDING",
                 "LAYING");

t<-combined_data

for (i in 1:nrow(t)) {combined_data$activity[i]<-activity_name[ t$activity[i] ]}


## Step 3 - create final tidy dataset -------------------------------

## The tidy dataset is created with with the averages (means) for all the measurement/feature variables
## for each combination of subject and activity

t<-combined_data
combined_data_tidy<-aggregate(t[,3:ncol(t)], by=list(subject=t$subject, activity=t$activity ), mean)

filename<-"combined_data_tidy.txt"
write.table(combined_data_tidy, filename, row.name=FALSE)

## Check can read the data back ok
combined_data_tidy[1:5,1:5]

t1<-read.table(filename, header=TRUE)
t1[1:5,1:5]
