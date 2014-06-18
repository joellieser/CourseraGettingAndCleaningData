# COMMENT: Load libraries for sqldf and data.table
library(sqldf)
library(data.table)
# COMMENT: create input and output directories if they don't exist
if(!file.exists("./samsung_project_input")) {dir.create("./samsung_project_input")}
if(!file.exists("./samsung_project_output")) {dir.create("./samsung_project_output")}
# COMMENT : download and untar the files 
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, destfile="./samsung_project_input/download.zip",method="curl")
untar("./samsung_project_input/download.zip", compressed = 'gzip', exdir = "./samsung_project_input")
# COMMENT: capture download information (datetime and url)
download_info                  <- cbind(date(),url)
download_info                  <- rbind(c("download_datetime","url"),download_info)
# COMMENT: read all data sets in
activity_labels            <- read.table("./samsung_project_input/UCI HAR Dataset/activity_labels.txt")
features                   <- read.table("./samsung_project_input/UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
subject_test               <- read.table("./samsung_project_input/UCI HAR Dataset/test/subject_test.txt")
subject_train              <- read.table("./samsung_project_input/UCI HAR Dataset/train/subject_train.txt")
x_test                     <- read.table("./samsung_project_input/UCI HAR Dataset/test/x_test.txt")
y_test                     <- read.table("./samsung_project_input/UCI HAR Dataset/test/y_test.txt")
x_train                    <- read.table("./samsung_project_input/UCI HAR Dataset/train/x_train.txt")
y_train                    <- read.table("./samsung_project_input/UCI HAR Dataset/train/y_train.txt")
# COMMENT: add names to activities
names(activity_labels)     <- c("activity_id","activity_description")
# COMMENT: remove parenthesis from feature names
features_skinny            <- gsub("\\(|\\)","",features[,2])
# COMMENT: add a column to indicate whether the subjects were in the test or train sets
x_test2                    <- cbind(test_v_train=rep("test",each=nrow(x_test)),x_test)
x_train2                   <- cbind(test_v_train=rep("train",each=nrow(x_train)),x_train)
# COMMENT: combine activities from test set and training set
all_y                      <- rbind(y_test,y_train)
# COMMENT: combine results from test set and training set
all_x                      <- rbind(x_test2,x_train2)
# COMMENT: combine subject ids from test set and training set
all_subjects               <- rbind(subject_test,subject_train)
# COMMENT: add name to activity column -- this is just the id at this point
names(all_y)               <- "activity_id"
# COMMENT: add column containing subject id and column containing activities to result data set
x_total                    <- cbind(all_subjects, all_y, all_x)
# COMMENT: apply activity description column to the data set
x_total_with_labels        <- sqldf("select a.activity_description,b.* from activity_labels a, x_total b WHERE a.activity_id = b.activity_id")
# COMMENT: drop the activity id column
x_total_with_labels[,3]    <- NULL
# COMMENT: apply improved names to the columns
names(x_total_with_labels) <- c("activity_description","subject_id","test_or_train_indicator",features_skinny)
# COMMENT: keep all rows but only select columns that contain the word "mean", "Mean" or "std"
just_means_std             <- x_total_with_labels[,grep("[mM]ean|std",names(x_total_with_labels))]
# COMMENT: take the first two columns from the larger data set and the select columns determined above
just_means_std_complete    <- cbind(activity_description=x_total_with_labels[,1],subject=x_total_with_labels[,2],just_means_std) 
# COMMENT: create an aggregate by subject and activity containing the means of all remaining selected columns from above
tidy_means                 <- aggregate(. ~ just_means_std_complete$subject + just_means_std_complete$activity_description, data = just_means_std_complete[,3:ncol(just_means_std_complete)], FUN=mean)
# COMMENT: clean up the names of the columns in the tidy dataset
names(tidy_means)[1:2]     <- c("subject","activity-description") 
# COMMENT: make all column names lowercase, per recommendation that I don't agree with that column names should all be lowercase
names(tidy_means)          <- tolower(names(tidy_means))
names(just_means_std_complete) <- tolower(names(just_means_std_complete))
# COMMENT: write output data sets
write.table(just_means_std_complete,"./samsung_project_output/complete.txt",sep="\t",row.names = FALSE)
write.table(tidy_means,"./samsung_project_output/tidy_means.txt",sep="\t",row.names = FALSE)
write.table(download_info,"./samsung_project_output/download_information.txt",sep="\t",row.names = FALSE,col.names = FALSE)
