# Load the files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempFile <- "UCI_HAR_Dataset.zip"
download.file(url, tempFile)
unzip(tempFile)
file.remove(tempFile)

# Load feature and activity labels
featureLabels <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load test data sets
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Create test df with feature_labels, test_data_y as activity_int, and subject_test as subject
labelNames <- featureLabels[, 2]
colnames(test_X) <- labelNames

test <- cbind(test_y, test_X)
test <- cbind(subjectTest, test)
names(test)[1] <- "subject_number"
names(test)[2] <- "activity_int"

# Load train data sets
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Create train df with feature_labels, train_data_y as activity_int and subject_train as subject
colnames(train_X) <- labelNames

train <- cbind(train_y, train_X)
train <- cbind(subjectTrain, train)
names(train)[1] <- "subject_number"
names(train)[2] <- "activity_int"

# Combine the two data sets
data <- rbind(test, train)

# Select columns that reference means and standard deviations
dataSubset <- data %>% 
  select(subject_number, activity_int, contains("mean"), contains("std") )

# Add in the activity labels based on the activity_int variable.
dataSubset  <- dataSubset %>%
  left_join(activityLabels, by = c("activity_int" = "V1")) %>%
  rename(activity_label = V2) %>%
  relocate(activity_label, .after = activity_int)

# Create groups by activity_label within subject_number
dataGroup <- dataSubset %>% 
  group_by(subject_number, activity_label) %>% 
  summarise_all(mean, na.rm = TRUE, exclude = c("column3"))
head(dataGroup)

# Write tidy data ina text file
write.table(dataGroup, file= "tidyData.txt",row.name=FALSE)


