# Coursera-Cleaning-Data-Project

This README file provides an overview of the `run_analysis.R` script, which is designed to download, process, and clean two datasets, ultimately merging them into a single tidy dataset. The final `grouped_df` dataframe is organized by experiment activities within subjects.

## Prequisites:

### Install and Load following Packages

1. tidyverse
2. dplyr
3. data.table

## Script Steps:

1. **Load Libraries**:  
   Import the `tidyverse` library, which includes all necessary tidy data packages.

2. **Download and Unzip Data**:

   - Set up a `url` variable with the dataset source: `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.
   - Define a temporary file name (`"UCI_HAR_Dataset.zip"`) and download the data to this file.
   - Use `unzip()` to extract the contents into the working directory.

3. **Review the Data Structure**:

   - Open `readme.txt` using `readLines()` for details on the sub-directory structure and file contents.

4. **Load Labels**:

   - Load `featureLabels` using `read.table` from `"UCI HAR Dataset/features.txt"`.
   - Load `activityLabels` from `"UCI HAR Dataset/activity_labels.txt"`.

5. **Process Test and Train Data**:

   - Load the `X`, `y`, and `subject` data files for both test and train subsets using `read.table()`.
   - Build the `test` and `train` dataframes:
     - Assign column names from `featureLabels` to the `X` data.
     - Use `cbind()` to merge the `X`, `y`, and `subject` data into a complete dataframe.
   - Repeat these steps for both the test and train data.

6. **Combine Data**:

   - Use `rbind()` to merge `test` and `train` into a single `data` dataframe.

7. **Select Mean and Standard Deviation Variables**:

   - Use `dplyr::select()` to extract variables with "mean" or "std" in their names, along with necessary identifiers.

8. **Add Activity Labels**:

   - Use `left_join()` to merge `activityLabels` with `data`.
   - Rename and reorder columns as needed.

9. **Group Data**:

   - Group the `data` dataframe by `activity_label` within each `subject_number`.

10. **Final Data Check**:
    - Verify that the data meets tidy data standards:
      - Each column represents a unique variable.
      - Each row is a unique observation.
      - Each cell contains a single value.

This process results in a clean, grouped dataframe ready for analysis.
