

#subsetting onset times for the face condition test response 9 for all four blocks
for (i in 1:4) {
  #creating a variable for each block for face9 (e.g., face9_B4 for face9 block4). if there are no trials for this
  #condition, then the script returns a "*" as required by AFNI
  face9 <-subset(mydata, Block == i & Test.RESP == 9 & Image.RESP <5 & cattype == "face", select = Image.OnsetTime)
  if(nrow(face9)>0){
   assign(paste("face9_B", i, sep=""), t((face9-start[i])/1000))
  }else{
   face9<- "*"
   assign(paste("face9_B", i, sep=""), face9)
  }
  
} #end i for loop


#writing stim times to a .1D file. There is one .1D file per condition; each row contains the stim times
#separated by space for each run. In 1306, there are four runs
write(face9_B1, file = "face9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(face9_B2, file = "face9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(face9_B3, file = "face9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
write(face9_B4, file = "face9.1D",
      ncolumns = 30, append = TRUE, sep = " ")
