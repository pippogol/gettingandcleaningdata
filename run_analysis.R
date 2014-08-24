run_analysis<-function(directory="UCI HAR Dataset") {
  ## merge into one test data set
  sub1<-read.table("UCI HAR Dataset/test/subject_test.txt")
  x1<-read.table("UCI HAR Dataset/test/x_test.txt")
  y1<-read.table("UCI HAR Dataset/test/y_test.txt")
  d1<-cbind(x1,sub1,y1)
  ## merge into one train data set
  sub2<-read.table("UCI HAR Dataset/train/subject_train.txt")
  x2<-read.table("UCI HAR Dataset/train/x_train.txt")
  y2<-read.table("UCI HAR Dataset/train/y_train.txt")
  d2<-cbind(x2,sub2,y2)
  
  d<-rbind(d1,d2)
  
  feat<-read.table("UCI HAR Dataset/features.txt")
  m_obs<-subset(feat,grepl("mean()",feat[ ,2]))
  s_obs<-subset(feat,grepl("std()",feat[ ,2]))
  obs_listnum<-rbind(m_obs,s_obs)[ ,1]
  obs_name<-rbind(m_obs,s_obs)[ ,2]

  
  d_obs<-d[ ,c(obs_listnum,ncol(d)-1,ncol(d))] ##subset mean+std features
  names(d_obs)<-obs_name ##rename features
  names(d_obs)[ncol(d_obs)-1]<-"Subject"
  names(d_obs)[ncol(d_obs)]<-"Activity"
  
  act<-read.table("UCI HAR Dataset/activity_labels.txt")
  
  ##replace activity code with full name
  activity_lookup<-function(i) {
    act[i,2]
  }
  d_obs['Activity']<-lapply(d_obs['Activity'],activity_lookup)
  
  write.table(d_obs,"tidy_dataset.txt",row.name=FALSE)
  
  ## calculate average of all means and standard deviations
  tidy_avg<-aggregate(. ~ Activity + Subject, data=d_obs, FUN=mean)
  tidy_avg<-tidy_avg[order(tidy_avg$Activity, tidy_avg$Subject), ] 
  write.table(tidy_avg,"tidy_dataset_avg.txt",row.name=FALSE)
}