

#subsetting onset times for the place condition test response 9 for all four blocks
for (i in 1:4) {
  #creating a variable for each block for place9 (e.g., place9_B4 for place9 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  place9 <-subset(mydata, Block == i & Test.RESP == 9 & Image.RESP < 5 & cattype == "place", select = Image.OnsetTime)
  if(nrow(place9)>0){
   assign(paste("place9_B", i, sep=""), t((place9-start[i])/1000))
  }else{
   place9<- "*"
   assign(paste("place9_B", i, sep=""), place9)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; each row contains the stim times
#separated by space for each run. In 1306, there are four runs
write(place9_B1, file = "place9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(place9_B2, file = "place9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(place9_B3, file = "place9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(place9_B4, file = "place9.1D",
      ncolumns = 30, append = TRUE, sep = " ")

