

#subsetting onset times for the place condition MISS trials for all four blocks
for (i in 1:4) {
  #creating a variable for each block for placeMISS (e.g., placeMISS_B4 for place1 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  placeMISS <-subset(mydata, Block == i & Test.RESP < 4 & cattype == "place" & Image.RESP <5, select = Image.OnsetTime)
  if(nrow(placeMISS)>0){
   assign(paste("placeMISS_B", i, sep=""), t((placeMISS-start[i])/1000))
  }else{
   placeMISS<- "*"
   assign(paste("placeMISS_B", i, sep=""), placeMISS)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; each row contains the stim times
#separated by space for each run. In 1306, there are four runs
write(placeMISS_B1, file = "placeMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeMISS_B2, file = "placeMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeMISS_B3, file = "placeMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(placeMISS_B4, file = "placeMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
