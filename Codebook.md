# Explanation of Variables in the R Code

This section describes each variable used in the R code for processing and cleaning the UCI HAR Dataset.

## Variables

### 1. `url`

URL pointing to the zip file containing the UCI HAR Dataset.

### 2. `tempFile`

Temporary filename for downloading the dataset. The zip file is unzipped and deleted after extraction.

### 3. `featureLabels`

Contains feature names loaded from `features.txt`. The second column is used to label the dataset columns.

### 4. `activityLabels`

Contains activity labels loaded from `activity_labels.txt`. The first column includes integer codes, while the second column provides descriptive labels for activities (e.g., "WALKING").

### Test Data Variables

5. **`test_X`**

Contains sensor measurements for the test dataset, loaded from `X_test.txt`. Each row represents a sample, and each column corresponds to a feature.

6. **`test_y`**

Contains activity codes for the test dataset, loaded from `y_test.txt`. These codes match each sample in `test_X` with an activity.

7. **`subjectTest`**

Contains subject IDs for the test dataset, loaded from `subject_test.txt`. Each ID corresponds to the subject who generated each row in `test_X`.

8. **`labelNames`**

Contains feature names from `featureLabels` to label the columns in both `test_X` and `train_X`.

9. **`test`**

Combined dataframe for the test dataset that includes subject IDs (`subject_number`), activity codes (`activity_int`), and feature measurements. Created by binding `subjectTest`, `test_y`, and `test_X` columns together.

### Train Data Variables

10. **`train_X`**

Contains sensor measurements for the train dataset, similar to `test_X`, loaded from `X_train.txt`.

11. **`train_y`**

Contains activity codes for the train dataset, similar to `test_y`, loaded from `y_train.txt`.

12. **`subjectTrain`**

Contains subject IDs for the train dataset, similar to `subjectTest`, loaded from `subject_train.txt`.

13. **`train`**

Combined dataframe for the train dataset that includes subject IDs, activity codes, and feature measurements. Created by binding `subjectTrain`, `train_y`, and `train_X` columns together.

### Combined Data Variables

14. **`data`**

Dataframe that combines both test and train data using `rbind()`.

15. **`dataSubset`**

Subset of `data` containing only columns related to means and standard deviations, along with identifier columns.

16. **`dataGroup`**

Grouped version of `dataSubset`, organized by `subject_number` and `activity_label`. Summarizes data by calculating the mean for each variable within each group.
