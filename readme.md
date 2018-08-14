Code Book
How the raw data was processed

    The raw data set is downloaded and unzipped into a folder named  "UCI HAR Dataset"
All data divided on 2 sets train an test
in script file all data uploaded into separated data frames and compiled by fields
main data consist in files x_train.txt and x_test.txt
main data compiled by rbind in data frame "x"
after compiling x modified by filtering columns (mean and std)
activity column recieved by compiling y_train and y_ test from files y_train.txt and y_test.txt
subject column resieved by compiling subject_train and subject_test from files subject_train.txt and subject_test.txt
activity_labels recieved from file activity_labels.txt
features recieved from file features.txt
data frame with tidy data made by functions rbind and cbind 
    The data of the all_data data frame is grouped first by subject id and then by activity. A new summary_data data frame is created that contains the average of each measurement variable for each subject and each activity. This data frame is then written out to the average.tdata.txt file.

