run_analysis <- function(){

## Loading metadata
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Loadind test dataset
subject_test <- read.table(paste(getwd(), "test", "subject_test.txt", sep = "/"))
X_test <- read.table(paste(getwd(), "test", "X_test.txt", sep = "/"))
y_test <- read.table(paste(getwd(), "test", "y_test.txt", sep = "/"))
## Loading training dataset

subject_train <- read.table(paste(getwd(), "train", "subject_train.txt", sep = "/"))
X_train <- read.table(paste(getwd(), "train", "X_train.txt", sep = "/"))
y_train <- read.table(paste(getwd(), "train", "y_train.txt", sep = "/"))

## Construct test dataset and adding variable names
names(X_test) <- features$V2
names(subject_test) <- c("subject")
names(y_test) <- c("activity")
test_dataset <- cbind(subject_test, y_test, X_test)

##Construct training dataset and adding variable names
names(X_train) <- features$V2
names(subject_train) <- c("subject")
names(y_train) <- c("activity")
train_dataset <- cbind(subject_train, y_train, X_train)

## 1. Merging test and trainig datasets
full_dataset <- rbind(test_dataset, train_dataset)

## 2. Extracting mean and standard deviation
mean_names <- grep("mean", names(full_dataset))
std_names <- grep("std", names(full_dataset))
extr <- c(c(1,2), mean_names, std_names)
tidy_dataset <- full_dataset[, extr]

## 3. Adding descriptive activity names
labels <- activity_labels[,2]
tidy_dataset$activity <- labels[tidy_dataset$activity]

## 4. Adding descriptive variable names
names(tidy_dataset) <- sub("^t", "Time", names(tidy_dataset))
names(tidy_dataset) <- sub("^f", "Frequency", names(tidy_dataset))

## 5. Constructing a summary dataset
library(dplyr)
summary_dataset <- summarize_each(group_by(tidy_dataset, activity, subject), funs(mean))

## Save the datasets
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)
write.table(summary_dataset, "summary_dataset.txt", row.names = FALSE)
}
