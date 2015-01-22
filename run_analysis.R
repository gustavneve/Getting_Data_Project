#The following code assumes you have downloaded and extracted the zip data
#into your working directory. The code will load any required packages

#1. Reads data files and merges the training and the test sets to create one data set.

#Read each data file
XTest<-read.table("test/X_test.txt")
YTest<-read.table("test/Y_test.txt")

XTrain<-read.table("train/X_train.txt")
YTrain<-read.table("train/Y_train.txt")

SubjectTrain<-read.table("train/subject_train.txt")
SubjectTest<-read.table("test/subject_test.txt")

features<-read.table("features.txt")

activity<-read.table("activity_labels.txt")

#Combine matching files
Xdata<-rbind(XTest,XTrain)
Ydata<-rbind(YTest,YTrain)
SubjectData<-rbind(SubjectTest,SubjectTrain)

#Once combined, I used str() on each data set to examine what the data looked like.
#Based on the README.txt file in the original dataset, the Ydata contains activity lables
#Xdata contains the actual test and train data
#SubjectData contains the subject of each activity

#add more meaningful column headers
names(SubjectData)<-c("Subject")
names(Ydata)<-c("Activity")
names(Xdata)<-features$V2
names(activity)<-c("Activity","Activity Name")

#Merge final data sets together into a single data frame
CombineData<-cbind(SubjectData,Ydata)
FinalData<-cbind(CombineData,Xdata)

# 2. Create a subset of the data that contains only mean and standard deviation for each measurement
#I found that I had to add "\\" after mean, std, and inside the parenthesis, or the data included meanfreq as well as mean
SubsetData<-FinalData[,grepl("mean\\(\\)|std\\(\\)|Subject|Activity",names(FinalData))]

# 3. Use descriptive activity names to name the activities in the subset created in step 2
#I first read the activity file to find that 1=Walking, 2=Walking Upstairs, 3=Walking Downstairs, 4=Sitting, 5=Standing, 6=Laying
#I converted Activity into a charactor vector, replaced the numbers with a character string corresponding to the correct activity
SubsetData$Activity<-as.character(SubsetData$Activity)
SubsetData$Activity[SubsetData$Activity==1]<-"Walking"
SubsetData$Activity[SubsetData$Activity==2]<-"Walking Upstairs"
SubsetData$Activity[SubsetData$Activity==3]<-"Walking Downstairs"
SubsetData$Activity[SubsetData$Activity==4]<-"Sitting"
SubsetData$Activity[SubsetData$Activity==5]<-"Standing"
SubsetData$Activity[SubsetData$Activity==6]<-"Laying"

# 4. Lable data with descriptive variable names
#acc is acceleration
#gyro is angular velocity
#mag is magnitude
#t indicates the measurements were made based on time
#f indicates the measurements were made based on frequency
#some instances of BodyBody, replaced with Body
#removed () after mean and std
names(SubsetData)<-gsub("Acc","Acceleration",names(SubsetData))
names(SubsetData)<-gsub("Gyro","AngularVelocity",names(SubsetData))
names(SubsetData)<-gsub("Mag","Magnitude",names(SubsetData))
names(SubsetData)<-gsub("^t","Time",names(SubsetData))
names(SubsetData)<-gsub("^f","Frequency",names(SubsetData))
names(SubsetData)<-gsub("BodyBody","Body",names(SubsetData))
names(SubsetData)<-gsub("()","",names(SubsetData),fixed=TRUE)

#5 5. using the aggregate function to summarize data by Subject and Activity, take the mean of each variable
FinalDataTidy<-aggregate(.~Subject+Activity,SubsetData,mean)
FinalDataTidy<-FinalDataTidy[order(FinalDataTidy$Subject,FinalDataTidy$Activity),]
write.table(FinalDataTidy,file="TidyData.txt",row.names=FALSE)