# Code Book

##Prepared for Coursera Course: Getting and Cleaning Data
##Course Project

##Prepared by Steve Eubanks

The data is taken from the University of California, Irvine's "Human Activity Recognition Using Smartphones 
Data Set"

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities 
of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

More information about the study and the data set can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The R script associated with this repository manipulates the data from the UCI study to produce a data frame
called *finaldata*.

The final data set consists of 86 columns and 36 rows

###Columns

Each column represents a variable measured in the UCI study, and each row represents a category of observations.
The values are the means of each measured variable for each type of observation.

The variables (columns) are listed at the bottom of the code-book.

* Variables prefixed by "Time" represent time-domain measurements, while those prefixed by "Freq" represent 
frequency-domain measurements.

* "Body" indicates that a movement of the subject's body was measured, while "Gravity" indicates the measurement
of a gravitational effect.

* "Acc" indicates that the measurement came from the device's accelerometer, while "Gyro" indicates that the 
measurement came from the device's gyroscope.

* "Mean" indicates that the mean of the measurement is recorded, while "StanDev" indicates that the standard
deviation is recorded.

* X, Y and Z-Axis is an indication of the axis upon which movement was recorded for that measure.

###Rows

There is one row for each subject, named "Subject 1", "Subject 2", and so on through "Subject 30".
Additionally, there is one row for each activity, named as follows:  
  "WALKING"  
  "WALKING_UPSTAIRS"  
  "WALKING_DOWNSTAIRS"  
  "SITTING"  
  "STANDING"  
  "LAYING"  
  

####Column Names

"Time_BodyAcc_Mean()_X-Axis"  
"Time_BodyAcc_Mean()_Y-Axis"              
"Time_BodyAcc_Mean()_Z-Axis"  
"Time_BodyAcc_StanDev()_X-Axis"           
"Time_BodyAcc_StanDev()_Y-Axis"  
"Time_BodyAcc_StanDev()_Z-Axis"           
"Time_GravityAcc_Mean()_X-Axis"  
"Time_GravityAcc_Mean()_Y-Axis"           
"Time_GravityAcc_Mean()_Z-Axis"  
"Time_GravityAcc_StanDev()_X-Axis"        
"Time_GravityAcc_StanDev()_Y-Axis"  
"Time_GravityAcc_StanDev()_Z-Axis"        
"Time_BodyAccJerk_Mean()_X-Axis"  
"Time_BodyAccJerk_Mean()_Y-Axis"          
"Time_BodyAccJerk_Mean()_Z-Axis"  
"Time_BodyAccJerk_StanDev()_X-Axis"       
"Time_BodyAccJerk_StanDev()_Y-Axis"  
"Time_BodyAccJerk_StanDev()_Z-Axis"       
"Time_BodyGyro_Mean()_X-Axis"  
"Time_BodyGyro_Mean()_Y-Axis"             
"Time_BodyGyro_Mean()_Z-Axis"  
"Time_BodyGyro_StanDev()_X-Axis"          
"Time_BodyGyro_StanDev()_Y-Axis"  
"Time_BodyGyro_StanDev()_Z-Axis"          
"Time_BodyGyroJerk_Mean()_X-Axis"  
"Time_BodyGyroJerk_Mean()_Y-Axis"         
"Time_BodyGyroJerk_Mean()_Z-Axis"  
"Time_BodyGyroJerk_StanDev()_X-Axis"      
"Time_BodyGyroJerk_StanDev()_Y-Axis"  
"Time_BodyGyroJerk_StanDev()_Z-Axis"      
"Time_BodyAccMag_Mean()"  
"Time_BodyAccMag_StanDev()"               
"Time_GravityAccMag_Mean()"  
"Time_GravityAccMag_StanDev()"            
"Time_BodyAccJerkMag_Mean()"  
"Time_BodyAccJerkMag_StanDev()"           
"Time_BodyGyroMag_Mean()"  
"Time_BodyGyroMag_StanDev()"              
"Time_BodyGyroJerkMag_Mean()"  
"Time_BodyGyroJerkMag_StanDev()"          
"Freq_BodyAcc_Mean()_X-Axis"  
"Freq_BodyAcc_Mean()_Y-Axis"              
"Freq_BodyAcc_Mean()_Z-Axis"  
"Freq_BodyAcc_StanDev()_X-Axis"           
"Freq_BodyAcc_StanDev()_Y-Axis"  
"Freq_BodyAcc_StanDev()_Z-Axis"           
"Freq_BodyAcc_MeanFreq()_X-Axis"  
"Freq_BodyAcc_MeanFreq()_Y-Axis"          
"Freq_BodyAcc_MeanFreq()_Z-Axis"  
"Freq_BodyAccJerk_Mean()_X-Axis"          
"Freq_BodyAccJerk_Mean()_Y-Axis"  
"Freq_BodyAccJerk_Mean()_Z-Axis"          
"Freq_BodyAccJerk_StanDev()_X-Axis"  
"Freq_BodyAccJerk_StanDev()_Y-Axis"       
"Freq_BodyAccJerk_StanDev()_Z-Axis"  
"Freq_BodyAccJerk_MeanFreq()_X-Axis"      
"Freq_BodyAccJerk_MeanFreq()_Y-Axis"  
"Freq_BodyAccJerk_MeanFreq()_Z-Axis"      
"Freq_BodyGyro_Mean()_X-Axis"  
"Freq_BodyGyro_Mean()_Y-Axis"             
"Freq_BodyGyro_Mean()_Z-Axis"  
"Freq_BodyGyro_StanDev()_X-Axis"          
"Freq_BodyGyro_StanDev()_Y-Axis"  
"Freq_BodyGyro_StanDev()_Z-Axis"          
"Freq_BodyGyro_MeanFreq()_X-Axis"  
"Freq_BodyGyro_MeanFreq()_Y-Axis"         
"Freq_BodyGyro_MeanFreq()_Z-Axis"  
"Freq_BodyAccMag_Mean()"                  
"Freq_BodyAccMag_StanDev()"  
"Freq_BodyAccMag_MeanFreq()"              
"Freq_BodyBodyAccJerkMag_Mean()"  
"Freq_BodyBodyAccJerkMag_StanDev()"       
"Freq_BodyBodyAccJerkMag_MeanFreq()"  
"Freq_BodyBodyGyroMag_Mean()"             
"Freq_BodyBodyGyroMag_StanDev()"  
"Freq_BodyBodyGyroMag_MeanFreq()"         
"Freq_BodyBodyGyroJerkMag_Mean()"  
"Freq_BodyBodyGyroJerkMag_StanDev()"      
"Freq_BodyBodyGyroJerkMag_MeanFreq()"  
"angle(Time_BodyAccMean,gravity)"         
"angle(Time_BodyAccJerkMean),gravityMean)"  
"angle(Time_BodyGyroMean,gravityMean)"    
"angle(Time_BodyGyroJerkMean,gravityMean)"  
"angle(X,gravityMean)"                    
"angle(Y,gravityMean)"  
"angle(Z,gravityMean)" 
