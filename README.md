==================================================================
Coursera - Getting and Cleaning Data
README for course project
Created:  22/11/2014

==================================================================

This file documents the principal steps involved in creating the dataset "combined_data_tidy.txt" from a number of raw datsets supplied from the Human Activity Recognition research project.  Each step is implemented in the R script "run_analysis.R" which contains many comment lines providing further information about each step.

Note that the code in Step 0 of the script should only be run if the following files are NOT available in the working directory.  Otherwise start from Step 1.


Step 0 - download zip files and unzip

The source data are available at the following URL  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In Step 0 we download this zip file to the working directory and extract the following files into the working directory:

"X_train.txt"
"y_train.txt"

"X_test.txt"
"y_test.txt"

"subject_train.txt"
"subject_test.txt"

"features.txt"
"activity_labels.txt"


Step 1 - read the training and test sets and features data into R

The training and test sets are read using the read.fwf function using, in the case of the X_ files, a widths parameter determined by looking at the files using wordpad (and found a field width of 16) and determining the number of variables (561) from the "README.txt" file supplied with the zip file. The Y_ files (the activity codes associated with each record in the X_ files), and the subject_ files (the subject IDs for each record in the X_ files have a single field and a widths parameter of 3 was used for these.

The R 64-bit version was used for running this script.  Memory problems had been encountered with the 32-bit version when reading the large X_train file.  If you are using the 32-bit version you may need to reduce the buffersize parameter in read.fwf to a lower value than its default of 2000.

The "features.txt" dataset, which has two fields, is read using read.table and the two columns are assigned names "feature_num" and "feature".  The resultant R dataframe is called features and contains 561 rows.  


Step 2 - selection of relevant feature variables and attachment of subject and activity codes

The subset function is used to reduce the features dataframe down to just the features containing the strings 'mean', 'Mean' and 'std' yielding a dataframe called features_relevant with just 86 rows. The package stringr and fuunction str_detect are used for the string processing.

The feature names in this dataframe are cleaned up so that the features are valid variable names in R.  This is achieved using the plyr package and the function transmute.  The cleaning involves using the str_replace_all function to replace the following character strings "-",  "()", "(", ")", "," by ones suited to an R variable name.  The cleaned dataframe is called f.

The "feature_num" variable in the f dataframe is used to extract the relevant fields from the X_train and X_test dataframes each of which has 561 variables. The resultant dataframes are called train and test and each has 86 variables. The dataframe train is merged with the subject_train and Y_train dataframes in order to attach the subject and activity codes.  Likewise, the dataframe test is merged with the subject_test and Y_test dataframes.  This is achieved using the cbind function and the resultant dataframes are also called train and test.

Next, the datasets train and test are combined using the rbind function to create the dataframe combined_data.  The numeric activity codes (1-6) in combined_data are then replaced by activity descriptions (WALKING, WALKING_UPSTAIRS etc).


Step 3 - create final tidy dataset

The aggregate function is used to compute the means of each of the feature variables (columns 3-88) in combined_data where the mean is calculated for each combination of subject (30 of) and activity (6 of) thus resulting in a dataframe combined_data_tidy having 180 rows (= 30x6).

The write.table function using parameter row.name=FALSE is then used with combined_data_tidy to create the text file "combined_data_tidy.txt".

Finally, a check is made that the text file contains the same data as the dataframe combined_data_tidy by importing the file using read.table.









 