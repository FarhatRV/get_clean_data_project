  run_analysis<-function(){
    featureMeans=c(4:6,44:46,84:86,124:126,164:166,204,217,230,243,256,269:271,348:350,427:429,506,519,532,545);
            #required indices of means (+3 for activity number,activity label and subject's number)
  featureSTD=c(7:9,47:49,87:89,127:129,167:169,205,218,231,244,257,272:274,351:353,430:432,507,520,533,546);
            
  
            #required indices of standard deviation (+3 for activity number,activity label and subject's number)
  mergeData=data.frame();
  colnames<-c("Activity_Label","Subject_no","tBodyAccelerationMean_Xaxis","tBodyAccelerationMean_Yaxis","tBodyAccelerationMean_Zaxis","tGravityAccelerationMean_Xaxis","tGravityAccelerationMean_Yaxis","tGravityAccelerationMean_Zaxis","tBodyAccelerationJerkMean_Xaxis","tBodyAccelerationJerkMean_Yaxis","tBodyAccelerationJerkMean_Zaxis","tBodyGyroMean_Xaxis","tBodyGyroMean_Yaxis",
              "tBodyGyroMean_Zaxis","tBodyGyroJerkMean_Xaxis","tBodyGyroJerkMean_Yaxis","tBodyGyroJerkMean_Zaxis","tBodyAccelerationMagMean","tGravityAccelerationMagMean","tBodyAccelerationJerkMagMean","tBodyGyroMagMean","tBodyGyroJerkMagMean","fBodyAccelerationMean_Xaxis","fBodyAccelerationMean_Yaxis","fBodyAccelerationMean_Zaxis","fBodyAccelerationJerkMean_Xaxis",
              "fBodyAccelerationJerkMean_Yaxis","fBodyAccelerationJerkMean_Zaxis","fBodyGyroMean_Xaxis","fBodyGyroMean_Yaxis","fBodyGyroMean_Zaxis","fBodyAccelerationMagMean","fBodyBodyAccelerationJerkMagMean","fBodyBodyGyroMagMean","fBodyBodyGyroJerkMagMean","tBodyAccelerationStd_Xaxis","tBodyAccelerationStd_Yaxis","tBodyAccelerationStd_Zaxis","tGravityAccelerationStd_Xaxis","tGravityAccelerationStd_Yaxis","tGravityAccelerationStd_Zaxis","tBodyAccelerationJerkStd_Xaxis","tBodyAccelerationJerkStd_Yaxis","tBodyAccelerationJerkStd_Zaxis","tBodyGyroStd_Xaxis","tBodyGyroStd_Yaxis",
              "tBodyGyroStd_Zaxis","tBodyGyroJerkStd_Xaxis","tBodyGyroJerkStd_Yaxis","tBodyGyroJerkStd_Zaxis","tBodyAccelerationMagStd","tGravityAccelerationMagStd","tBodyAccelerationJerkMagStd","tBodyGyroMagStd","tBodyGyroJerkMagStd","fBodyAccelerationStd_Xaxis","fBodyAccelerationStd_Yaxis","fBodyAccelerationStd_Zaxis","fBodyAccelerationJerkStd_Xaxis","fBodyAccelerationJerkStd_Yaxis","fBodyAccelerationJerkStd_Zaxis","fBodyGyroStd_Xaxis","fBodyGyroStd_Yaxis","fBodyGyroStd_Zaxis","fBodyAccelerationMagStd","fBodyBodyAccelerationJerkMagStd","fBodyBodyGyroMagStd","fBodyBodyGyroJerkMagStd")
  
            
  
            #Objective-1:Merge the training and the test sets to create one data set.
  mergeRaw<-function(){
    setwd("train");
    subjectTrain=read.table("subject_train.txt");
    trainLabel=read.table("y_train.txt");
    trainSet=read.table("X_train.txt");
    names(subjectTrain)="subject_no";
    names(trainLabel)="activity";
    trainSet=cbind(trainLabel,trainSet);
    trainSet=cbind(subjectTrain,trainSet);
    setwd("..");
    setwd("test");
    subjectTest=read.table("subject_test.txt");
    testLabel=read.table("y_test.txt");
    testSet=read.table("X_test.txt");
    names(subjectTest)="subject_no";
    names(testLabel)="activity";
    testSet=cbind(testLabel,testSet);
    testSet=cbind(subjectTest,testSet);
    mergeData=rbind(trainSet,testSet);
    setwd("..");
    mergeData
  }
  
  
            #Objective-3:Use descriptive activity names to name the activities in the data set
  activityDescription<-function(){
    
    activityName=read.table("activity_labels.txt");
    activityName=activityName[,2];
    activityName=as.character(activityName);
    activityName=activityName[mergeData$activity];
    mergeData=cbind(activityName,mergeData);
    mergeData
  }
  
  
  
            #Objective-4:Appropriately label the data set with descriptive variable names.
  featureDescription<-function(){
    
    features=read.table("features.txt");
    features=features[,2];
    features=as.character(features);
    features=c("activityName","subject_no","activity",features);
    names(mergeData)=features;
    mergeData
  }
  
  
  
            #Objective-2:Extract only the measurements on the mean and standard deviation for each measurement. 
  mean_std_features<-function(){
    
    mergeData=mergeData[,c(1:3,featureMeans,featureSTD)];
  }
  
  
  
  
  mergeData=mergeRaw();
  mergeData=activityDescription();
  mergeData=featureDescription();
  mergeData=mean_std_features();
  
  
  
            #Objective-5:Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  tidyData<-function()
  {
    Subject_No<-as.integer(as.character(sapply(split(mergeData[[2]],list(mergeData[[2]],mergeData[[3]])),function(x) x[1])));
    Activity_Labels<-as.character(sapply(split(mergeData[[1]],list(mergeData[[2]],mergeData[[3]])),function(x) x[1]));
    tidy<-data.frame(Activity_Labels,Subject_No);
    for(i in 4:69)
    {
      tidy<-data.frame(tidy, sapply(split(mergeData[[i]],list(mergeData[[1]],mergeData[[2]])),mean));
      names
    }
    names(tidy)=colnames
    
    write.table(tidy,"tidydataset.txt",col.names=TRUE,row.names=FALSE,sep="  ")
    tidy<-read.table("tidydataset.txt",header=TRUE)
    tidy
  }
  
  
  
  mergeData=tidyData();
  mergeData    #final tidy,independent data required
  }