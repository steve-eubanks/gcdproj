# Data Prep:
## Added two rows to the features.txt file.
### 562 Training_Labels
### 563 Subjects

# Read in the files
## Reading the y_train and y_test files as character makes it easier later to convert
## the codes to descriptive text as specified by step 3 in the project instructions
HAR_x_train <- read.table("HARdata/train/X_train.txt", header = FALSE)
HAR_y_train <- read.table("HARdata/train/y_train.txt", colClasses = "character", header = FALSE)
HAR_sub_train <- read.table("HARdata/train/subject_train.txt", header = FALSE)
HAR_x_test <- read.table("HARdata/test/X_test.txt", header = FALSE)
HAR_y_test <- read.table("HARdata/test/y_test.txt", colClasses = "character", header = FALSE)
HAR_sub_test <- read.table("HARdata/test/subject_test.txt", header = FALSE)
HAR_col_names <- read.table("HARdata/features.txt", stringsAsFactors = FALSE)

# Add rows to HAR_col_labels with column names for Activities and Subjects
HAR_col_names <- rbind(HAR_col_names,c("562","Activities"))
HAR_col_names <- rbind(HAR_col_names,c("563","Subjects"))

# Make merge file in order of x, y, subject
merge_test <- cbind(HAR_x_test,HAR_y_test)
merge_test <- cbind(merge_test,HAR_sub_test)

# Make merge file in order of x, y, subject
merge_train <- cbind(HAR_x_train,HAR_y_train)
merge_train <- cbind(merge_train,HAR_sub_train)

# Merge test and train row-wise using rbind
merge_file <- rbind(merge_test,merge_train)

# Assign column names to the merged file using HAR_col_names, which came from the 
# modified features.txt file.  This completes step 1 of the project instructions.
colnames(merge_file) <- HAR_col_names$V2

# Next I collect all columns measuring a mean or standard deviation. 
# Using ignore.case = TRUE in order to pick up columns containing either "mean" 
# or "Mean" in the column name. 
#
# Including "Activities" adds the Activities column as well, which is necessary
# in order to complete step 3 of the project instructions.
#
# When initializing the "smallerdf" data frame, I get a column of nulls, thus as I
# build my data frame using cbind, my data actually starts at the second column.
# This is why I initialize the "counter" at 1, and increment it to 2 before appending
# my first column of data.  At the end of the loop, I clean this up by removing
# the first column of null data. This completes step 2 of the project instructions.
smallerdf <- data.frame
counter <- 1
for(i in 1:ncol(merge_file)) {
  if (grepl("mean|std|Activities|Subjects",colnames(merge_file)[i], ignore.case = TRUE)) {
    counter <<- counter+1
    smallerdf <- cbind(smallerdf,merge_file[,i])
    colnames(smallerdf)[counter] <- colnames(merge_file)[i]
  }
}
smallerdf <- smallerdf[,-1]

# Next I replace the numeric codes from the y_train and y_test files with the more 
# descriptive content from the activity_labels file. This completes step 3 of the
# project instructions.
smallerdf[,"Activities"] <- gsub("1","WALKING",smallerdf[,"Activities"])
smallerdf[,"Activities"] <- gsub("2","WALKING_UPSTAIRS",smallerdf[,"Activities"])
smallerdf[,"Activities"] <- gsub("3","WALKING_DOWNSTAIRS",smallerdf[,"Activities"])
smallerdf[,"Activities"] <- gsub("4","SITTING",smallerdf[,"Activities"])
smallerdf[,"Activities"] <- gsub("5","STANDING",smallerdf[,"Activities"])
smallerdf[,"Activities"] <- gsub("6","LAYING",smallerdf[,"Activities"])

# Next I modify the variable (column) names to make them more descriptive.  This completes step 4 of the
# project instructions.
colnames(smallerdf) <- gsub("tB", "Time_B", colnames(smallerdf))
colnames(smallerdf) <- gsub("tG", "Time_G", colnames(smallerdf))
colnames(smallerdf) <- gsub("fB", "Freq_B", colnames(smallerdf))
colnames(smallerdf) <- gsub("fG", "Freq_G", colnames(smallerdf))
colnames(smallerdf) <- gsub("-mean()", "_Mean", colnames(smallerdf))
colnames(smallerdf) <- gsub("-std()", "_StanDev", colnames(smallerdf))
colnames(smallerdf) <- gsub("-X", "_X-Axis", colnames(smallerdf))
colnames(smallerdf) <- gsub("-Y", "_Y-Axis", colnames(smallerdf))
colnames(smallerdf) <- gsub("-Z", "_Z-Axis", colnames(smallerdf))

# Next I create the final data frame of averages as specified in step 5.  

# First I initiate some variables
vctr <- 0
sctr <- 0
temprownames <- vector
finaldata <- data.frame(matrix(nrow = 36,ncol = 86))

# I give the column names of the 86 variables to the final data set
colnames(finaldata) <- colnames(smallerdf[,1:86])

# I use two nested for loops to go through each subject and calculate a row of means of the variables
# for each subject.  Each loop (1:30) creates a row for the respective subject, then each loop (1:86)
# calculates a mean and puts it in the column for that variable.
## While I'm at it, I begin creating a vector of row names that I'll apply to the data frame later
for (sctr in 1:30) {
  temprownames <- append(temprownames,paste("Subject",sctr))
  for (vctr in 1:86) {
    finaldata[sctr,vctr] <- mean(as.numeric(smallerdf[which(smallerdf[,"Subjects"] == sctr),vctr]))
  }
}

# Once the means for each subject are created, I now create means for each activity.  
for (vctr1 in 1:86) {
  finaldata[31,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "WALKING"),vctr1]))
  finaldata[32,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "WALKING_UPSTAIRS"),vctr1]))
  finaldata[33,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "WALKING_DOWNSTAIRS"),vctr1]))
  finaldata[34,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "SITTING"),vctr1]))
  finaldata[35,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "STANDING"),vctr1]))
  finaldata[36,vctr1] <- mean(as.numeric(smallerdf[which(smallerdf[,"Activities"] == "LAYING"),vctr1]))
}

# Then I create rownames for the activity rows4
temprownames <- append(temprownames,"WALKING")
temprownames <- append(temprownames,"WALKING_UPSTAIRS")
temprownames <- append(temprownames,"WALKING_DOWNSTAIRS")
temprownames <- append(temprownames,"SITTING")
temprownames <- append(temprownames,"STANDING")
temprownames <- append(temprownames,"LAYING")
# I have an extra element at the front of my vector that I have to get rid of
temprownames[[1]] <- NULL

# I assign the row names to the data frame.
rownames(finaldata) <- temprownames

# This completes step 5 of the project instructions