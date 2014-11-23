Coursera - Getting and Cleaning Data
Codebook for dataset:  "combined_data_tidy.txt"
Created:  22/11/2014


This dataset is based on the Human Activity Recognition Using Smartphones Dataset Version 1.0 prepared by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory, Genoa, Italy www.smartlab.ws further details of which may be found in the files "README.txt" and "features_info.txt"  supplied with the Coursera project materials


The datasets are based on experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, and captured 3-axial linear acceleration and 3-axial angular velocities at a constant rate of 50Hz. The experiments were video-recorded in order to label the data manually. 

The Coursera supplied data included training and test datasets in which each obervation represents a summary of sensor signal data (a feature vector of variables) for a subject undertaking a particular activity.  Files enabling these observations to be linked with a subject ID and activity Code were also provided.  There are multiple records for each subject/activity combination representing activity repetitions for each of 30 subjects.

In creating the "combined_data_tidy.txt" dataset we first selected only those feature variables which related to means or standard deviations (a total of 86 variables out of a total of 561 variables). Secondly we computed the means of each of these 86 variables for each subject/activity combination.  See the "README.md" and "run_analysis.R" files for further details of the processing carried out.

The variables in "combined_data_tidy.txt" are listed below alongside the column number.  Columns 1 and 2 give subject and activity (WALKING etc) respectively.  Columns 3 to 88 give the MEANS of the 86 sensory feature variables where the mean has been taken over the particular subject/activity combination.  The names of variables are derived from those given in the "features.txt" file supplied with the Coursera project materials and further information can be found in the "README.txt" and "features_info.txt" which were also supplied with the Coursera project materials.

If you are viewing this file on GitHub then please view it using the 'raw' option as the following table will not display correctly otherwise!

Column	Variable Name

1	subject
2	activity
3	tBodyAcc_mean_X
4	tBodyAcc_mean_Y
5	tBodyAcc_mean_Z
6	tBodyAcc_std_X
7	tBodyAcc_std_Y
8	tBodyAcc_std_Z
9	tGravityAcc_mean_X
10	tGravityAcc_mean_Y
11	tGravityAcc_mean_Z
12	tGravityAcc_std_X
13	tGravityAcc_std_Y
14	tGravityAcc_std_Z
15	tBodyAccJerk_mean_X
16	tBodyAccJerk_mean_Y
17	tBodyAccJerk_mean_Z
18	tBodyAccJerk_std_X
19	tBodyAccJerk_std_Y
20	tBodyAccJerk_std_Z
21	tBodyGyro_mean_X
22	tBodyGyro_mean_Y
23	tBodyGyro_mean_Z
24	tBodyGyro_std_X
25	tBodyGyro_std_Y
26	tBodyGyro_std_Z
27	tBodyGyroJerk_mean_X
28	tBodyGyroJerk_mean_Y
29	tBodyGyroJerk_mean_Z
30	tBodyGyroJerk_std_X
31	tBodyGyroJerk_std_Y
32	tBodyGyroJerk_std_Z
33	tBodyAccMag_mean
34	tBodyAccMag_std
35	tGravityAccMag_mean
36	tGravityAccMag_std
37	tBodyAccJerkMag_mean
38	tBodyAccJerkMag_std
39	tBodyGyroMag_mean
40	tBodyGyroMag_std
41	tBodyGyroJerkMag_mean
42	tBodyGyroJerkMag_std
43	fBodyAcc_mean_X
44	fBodyAcc_mean_Y
45	fBodyAcc_mean_Z
46	fBodyAcc_std_X
47	fBodyAcc_std_Y
48	fBodyAcc_std_Z
49	fBodyAcc_meanFreq_X
50	fBodyAcc_meanFreq_Y
51	fBodyAcc_meanFreq_Z
52	fBodyAccJerk_mean_X
53	fBodyAccJerk_mean_Y
54	fBodyAccJerk_mean_Z
55	fBodyAccJerk_std_X
56	fBodyAccJerk_std_Y
57	fBodyAccJerk_std_Z
58	fBodyAccJerk_meanFreq_X
59	fBodyAccJerk_meanFreq_Y
60	fBodyAccJerk_meanFreq_Z
61	fBodyGyro_mean_X
62	fBodyGyro_mean_Y
63	fBodyGyro_mean_Z
64	fBodyGyro_std_X
65	fBodyGyro_std_Y
66	fBodyGyro_std_Z
67	fBodyGyro_meanFreq_X
68	fBodyGyro_meanFreq_Y
69	fBodyGyro_meanFreq_Z
70	fBodyAccMag_mean
71	fBodyAccMag_std
72	fBodyAccMag_meanFreq
73	fBodyBodyAccJerkMag_mean
74	fBodyBodyAccJerkMag_std
75	fBodyBodyAccJerkMag_meanFreq
76	fBodyBodyGyroMag_mean
77	fBodyBodyGyroMag_std
78	fBodyBodyGyroMag_meanFreq
79	fBodyBodyGyroJerkMag_mean
80	fBodyBodyGyroJerkMag_std
81	fBodyBodyGyroJerkMag_meanFreq
82	angle_tBodyAccMean_gravity
83	angle_tBodyAccJerkMean_gravityMean
84	angle_tBodyGyroMean_gravityMean
85	angle_tBodyGyroJerkMean_gravityMean
86	angle_X_gravityMean
87	angle_Y_gravityMean
88	angle_Z_gravityMean
