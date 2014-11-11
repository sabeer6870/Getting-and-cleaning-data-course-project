Getting-and-cleaning-data-course-project
========================================

Coursera getting and cleaning data  Course project

run_analysis.R will first read the data and then merege the training and test data into one which will be stored in x_data y_data and subject_data.

Then in step 2 data extraction will happen and and x_data column names will be updated with relevant names from the features from the features.txt file.

Now, y_data columns will be updated by activity.txt file and final_data will be created with columnwise combination of x_data,y_data and subject_data.

In this phase labeling of data will happen and finally average_data will be created from the final_data and averageing will be done for each variable and average_data.txt file will be created.
