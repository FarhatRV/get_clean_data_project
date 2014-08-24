####README

###Overview:
The project is on cleaning data obtained from web( in csv format) to extraxt out 
a clean,independent and more productive data set that can be used for further analysis in wearable computing.
The data was collected from the accelerometers from the
Samsung Galaxy S smartphone for 
the purpose of activity recognition. A full description is available at the site where the 
data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones].


Included in this repo are:


* run_analysis.R - the main script from producing the tidy data set.

* codebook.md - descibes the original dataset, the variables in the tidy data set and transformations used to obtain them.
* tidy_data.txt

####Description of run_analysis.R:
 
###mergeRaw():
	It reads in the training and test datasets separately into a data frame and then merges them into one data frame.

###activityDescription():
	It reads in the names of the activities being monitored from "activity_labels.txt" and 
assigns the descriptive activity names to the data corresponding to each activity number.

###featureDescription():
	It reads in the names of the features and the set of variables( for example, mean, standard deviation, max, min) 
that were estimated from these features from "features.txt" and labels the column names of the dataset accordingly 
along with that of activity name,activity number and subject number.

###mean_std_features():
	It extracts out only the measurements on the mean and standard deviation for each measurement of the dataset.

###tidyData():
	 It creates a second, independent tidy data set with the average of each variable for each activity and each 
subject. Thus how we obtain our required dataset that is clean and ordered well for analysis in wearable computing.

