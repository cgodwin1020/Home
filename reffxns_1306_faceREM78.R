
#subsetting onset times for the face condition test responses 7 or 8 (low/med confidence remember) for all four blocks
for (i in 1:4) {
  #creating a variable for each block for faceREM78 (e.g., faceREM78_B4 for faceREM78 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  faceREM78 <-subset(mydata, Block == i & (Test.RESP == 7 | Test.RESP == 8) & Image.RESP <5 & cattype == "face", select = Image.OnsetTime)
  if(nrow(faceREM78)>0){
   assign(paste("faceREM78_B", i, sep=""), t((faceREM78-start[i])/1000))
  }else{
   faceREM78<- "*"
   assign(paste("faceREM78_B", i, sep=""), faceREM78)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; each row contains the stim times
#separated by space for each run. In 1306, there are four runs
write(faceREM78_B1, file = "faceREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceREM78_B2, file = "faceREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceREM78_B3, file = "faceREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(faceREM78_B4, file = "faceREM78.1D",
      ncolumns = 30, append = TRUE, sep = " ")

