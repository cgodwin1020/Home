

#subsetting onset times for the face condition test response 1 for all four blocks
for (i in 1:4) {

  faceMISS <-subset(mydata, Block == i & Test.RESP < 4 & cattype == "face" & Image.RESP <5, select = Image.OnsetTime)
  
  #creating a variable for each block for faceMISS (e.g., faceMISS_B4 for face1 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  
  if(nrow(faceMISS)>0){
   assign(paste("faceMISS_B", i, sep=""), t((faceMISS-start[i])/1000)) #subtracting scanner start time and converting ms to seconds
  }else{
   faceMISS<- "*"
   assign(paste("faceMISS_B", i, sep=""), faceMISS)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; there is 
#one row per condition. Each row contains the stim times
#separated for that run, separated by a space. In 1306, there are four runs
write(faceMISS_B1, file = "faceMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceMISS_B2, file = "faceMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceMISS_B3, file = "faceMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceMISS_B4, file = "faceMISS.1D",
      ncolumns = 30, append = TRUE, sep = " ")

