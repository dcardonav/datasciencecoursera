
#This script transforms the raw data provided for the project
#into the the requested tidy data

#For this script to work, a directory called dataset must be located
#in the same directory as the script file; this dataset directory
#must contain the unzipped files for the project

# Here we load the training and the test data into the workspace

# read test and training files
df_test <- read.table("dataset\\test\\X_test.txt", colClasses="numeric", nrows=2947)
df_train <- read.table("dataset\\train\\X_train.txt", colClasses="numeric", nrows=7352)

# loads subject data
sbj_test <- read.table("dataset\\test\\subject_test.txt", colClasses="numeric", nrows=2947)
sbj_train <- read.table("dataset\\train\\subject_train.txt", colClasses="numeric", nrows=7352)

# adds subject data to datasets
df_test <- cbind(sbj_test, df_test)
df_train <- cbind(sbj_train, df_train)

# merges the two datasets, take note of the order
df <- rbind(df_test, df_train)

# remove data from workspace
rm(df_test, df_train)

# next we load the variable names
features <- read.table("dataset\\features.txt")

# variables that have mean or std and creates new data frame
ind <- grepl("+mean+|+std+",features[,2])
df <- df[, features[ind,1]]
colnames(df) <- features[ind,2]

# next we load the activity names and the activity data in the same order
act_test <- read.table("dataset\\test\\y_test.txt", colClasses="numeric", nrows=2947)
act_train <- read.table("dataset\\train\\y_train.txt", colClasses="numeric", nrows=7352)
df_act <- rbind(act_test, act_train)
act <- read.table("dataset\\activity_labels.txt", colClasses=c("numeric", "character"))
colnames(df_act) <- c("act_id")
colnames(act) <- c("act_id", "act_name")
df <- cbind(df_act, df)

# next we merge the datasets to add a new variable with thea activity names
df <- merge(x=df, y=act, by.x="act_id", by.y="act_id", all.x=TRUE,sort=FALSE)
colnames(df)[81] <- c("act_name")
colnames(df)[2] <- c("sbj_id")

# reordering of the columns
df <- df[,c(2, 81, seq(from=3, to=80, by=1))]

# aggregate data by subject and activity
final <- aggregate(df[,3:80], by=list(sbj_id=df$sbj_id, act_name=df$act_name), FUN=mean)





