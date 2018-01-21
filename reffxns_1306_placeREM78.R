

#subsetting onset times for the place condition test response 7 or 8 (low/med confidence remember) for all four blocks
for (i in 1:4) {
  #creating a variable for each block for placeREM78 (e.g., placeREM78_B4 for placeREM78 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  placeREM78 <-subset(mydata, Block == i & (Test.RESP == 7 | Test.RESP == 8) & Image.RESP < 5 & cattype == "place", select = Image.OnsetTime)
  if(nrow(placeREM78)>0){
   assign(paste("placeREM78_B", i, sep=""), t((placeREM78-start[i])/1000))
  }else{
   placeREM78<- "*"
   assign(paste("placeREM78_B", i, sep=""), placeREM78)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; each row contains the stim times
#separated by space for each run. In 1306, there are four runs
write(placeREM78_B1, file = "placeREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeREM78_B2, file = "placeREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeREM78_B3, file = "placeREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeREM78_B4, file = "placeREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")

