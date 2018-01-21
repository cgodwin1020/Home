
#this script runs all the reffxns_1306_*.R files below. They all need to be in the same directory, along
#with the .csv file. You need to edit the read.csv file specified in the read.csv function below and the four scanner start times in the start variable

#MISS indicate NEW response (i.e., miss aka forgot)
#REM78 indicate OLD low/med confidence response (i.e., hit aka remembered)
#9 indicates high confidence remember trials
mydata <- read.csv("RFA_all_016.csv", stringsAsFactors = FALSE)

start <- c(27293, 22836, 26517, 27543) #scanner start times in ms for each block for the subject you're processing

source("reffxns_1306_faceMISS.R")
source("reffxns_1306_faceREM78.R")
source("reffxns_1306_face9.R")
source("reffxns_1306_placeMISS.R")
source("reffxns_1306_placeREM78.R")
source("reffxns_1306_place9.R")



#1-3 indicate NEW response (i.e., miss aka forgot)
#7-8 indcate OLD response (i.e., hit aka remembered)

# source("reffxns_1306_face1.R")
# source("reffxns_1306_face2.R")
# source("reffxns_1306_face3.R")
# source("reffxns_1306_face7.R")
# source("reffxns_1306_face8.R")
# source("reffxns_1306_face9.R")
# 
# source("reffxns_1306_place1.R")
# source("reffxns_1306_place2.R")
# source("reffxns_1306_place3.R")
# source("reffxns_1306_place7.R")
# source("reffxns_1306_place8.R")
# source("reffxns_1306_place9.R")


