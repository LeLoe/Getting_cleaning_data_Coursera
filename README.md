Description of Run_Analysis
-----------------------------------

This script uses the "Human Activity Recognition Using Smartphones Dataset"
from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and combines the data to a new dataset.

### Data
The data is from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


### Input  
The following input is used and should be available in the working directory of R:

- 'features.txt': List of all features/sensordata.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set with sensordata.

- 'train/y_train.txt': Training activity labels.

- 'test/X_test.txt': Test set with sensordata.

- 'test/y_test.txt': Test activity labels.

### Output  
The output is a tab delimited file, with the mean values for each activity a subject has performed of the mean and standard deviation of the sensor signals.

The output is written in a file "tidy_data.txt" in the working directory 

### Prerequisites  
The files should be available in the working directory as specified in 'input'.

The library 'reshape2' has to be installed in R.

### Script  

The script consists of several steps:

step 1: Read the files into tables   
step 2: Append test and train files (sensordata, subjectdata and activity labels) and give columnNames to the sensordata of train_x and test_x.   
step 3: Select only mean and standard deviation from the appended dataset "x_train" and "x_test"   
step 4: Substitute activitylabels with activitynames with the information of file "activity_labels"  
step 5: Merge subject and activity data with the mean and standard deviation sensor data to one dataset and give descriptive columnames  
step 6: Creates a new independent tidy data set with the average of each mean and standard deviation variable of sensor data for each activity and each subject.    
step 7: Write tidy dataset in a file called "tidy_data.txt"

 



