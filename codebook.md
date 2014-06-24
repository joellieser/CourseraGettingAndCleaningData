##Code Book

#Data Origin

For additional information on the data set, see:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input data can be retrieved from (though the script will automatically get it for you, despite the assignment not calling for it):

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Merging and Filtering

Within the downloaded package, features.txt provides information about the entire data set.

#Features Selection 

Only feature columns containing the value "std", "Mean" or "mean" are used in the output.

 [3] "tbodyacc-mean-x"                    "tbodyacc-mean-y"                   
 [5] "tbodyacc-mean-z"                    "tbodyacc-std-x"                    
 [7] "tbodyacc-std-y"                     "tbodyacc-std-z"                    
 [9] "tgravityacc-mean-x"                 "tgravityacc-mean-y"                
[11] "tgravityacc-mean-z"                 "tgravityacc-std-x"                 
[13] "tgravityacc-std-y"                  "tgravityacc-std-z"                 
[15] "tbodyaccjerk-mean-x"                "tbodyaccjerk-mean-y"               
[17] "tbodyaccjerk-mean-z"                "tbodyaccjerk-std-x"                
[19] "tbodyaccjerk-std-y"                 "tbodyaccjerk-std-z"                
[21] "tbodygyro-mean-x"                   "tbodygyro-mean-y"                  
[23] "tbodygyro-mean-z"                   "tbodygyro-std-x"                   
[25] "tbodygyro-std-y"                    "tbodygyro-std-z"                   
[27] "tbodygyrojerk-mean-x"               "tbodygyrojerk-mean-y"              
[29] "tbodygyrojerk-mean-z"               "tbodygyrojerk-std-x"               
[31] "tbodygyrojerk-std-y"                "tbodygyrojerk-std-z"               
[33] "tbodyaccmag-mean"                   "tbodyaccmag-std"                   
[35] "tgravityaccmag-mean"                "tgravityaccmag-std"                
[37] "tbodyaccjerkmag-mean"               "tbodyaccjerkmag-std"               
[39] "tbodygyromag-mean"                  "tbodygyromag-std"                  
[41] "tbodygyrojerkmag-mean"              "tbodygyrojerkmag-std"              
[43] "fbodyacc-mean-x"                    "fbodyacc-mean-y"                   
[45] "fbodyacc-mean-z"                    "fbodyacc-std-x"                    
[47] "fbodyacc-std-y"                     "fbodyacc-std-z"                    
[49] "fbodyacc-meanfreq-x"                "fbodyacc-meanfreq-y"               
[51] "fbodyacc-meanfreq-z"                "fbodyaccjerk-mean-x"               
[53] "fbodyaccjerk-mean-y"                "fbodyaccjerk-mean-z"               
[55] "fbodyaccjerk-std-x"                 "fbodyaccjerk-std-y"                
[57] "fbodyaccjerk-std-z"                 "fbodyaccjerk-meanfreq-x"           
[59] "fbodyaccjerk-meanfreq-y"            "fbodyaccjerk-meanfreq-z"           
[61] "fbodygyro-mean-x"                   "fbodygyro-mean-y"                  
[63] "fbodygyro-mean-z"                   "fbodygyro-std-x"                   
[65] "fbodygyro-std-y"                    "fbodygyro-std-z"                   
[67] "fbodygyro-meanfreq-x"               "fbodygyro-meanfreq-y"              
[69] "fbodygyro-meanfreq-z"               "fbodyaccmag-mean"                  
[71] "fbodyaccmag-std"                    "fbodyaccmag-meanfreq"              
[73] "fbodybodyaccjerkmag-mean"           "fbodybodyaccjerkmag-std"           
[75] "fbodybodyaccjerkmag-meanfreq"       "fbodybodygyromag-mean"             
[77] "fbodybodygyromag-std"               "fbodybodygyromag-meanfreq"         
[79] "fbodybodygyrojerkmag-mean"          "fbodybodygyrojerkmag-std"          
[81] "fbodybodygyrojerkmag-meanfreq"      "angletbodyaccmean,gravity"         
[83] "angletbodyaccjerkmean,gravitymean"  "angletbodygyromean,gravitymean"    
[85] "angletbodygyrojerkmean,gravitymean" "anglex,gravitymean"                
[87] "angley,gravitymean"                 "anglez,gravitymean"    

#Final Calculation

The mean of all remaining columns are averaged and written to the output file.

Additional output files containing the date of the download and the full (non averaged) std and mean variables is also written, though this was not necessary for the assignment.

# The following variables are present in the data:

just_means_std_complete

"subject"                            
"activity_description"              

write.table(tidy_means,"./samsung_project_output/tidy_means.txt",sep="\t",row.names = FALSE) 

"subject"                            
"activity-description"
              
write.table(download_info,"./samsung_project_output/download_information.txt",sep="\t",row.names = FALSE,col.names = FALSE)

"download_datetime"
"url"

## NOTE: I'm admittedly submitting this late, so feel free to indicate it as not included.  
