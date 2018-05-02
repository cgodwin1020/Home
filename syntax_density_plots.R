
#for plotting density by subject

mydata_valid <- mydata_skewness

by(mydata_valid, mydata_valid$subject_ID, function(x){ dense.sub <- density(x$RTT)
i <- as.character(x$subject_ID)
sub <- i[1]
filename <- paste0("density_plot_", sub,".png")
png(filename)
d <- plot(dense.sub, filename)
print(d)
dev.off()

})


#for plotting density by condition


by(mydata_valid, mydata_valid$promptRESP_RFA, function(x){ dense.condition <- density(x$RTT)
i <- as.character(x$promptRESP_RFA)
cond <- i[1]
filename <- paste0("density_plot_condition", cond,".png")
png(filename)
d <- plot(dense.condition, filename)
print(d)
dev.off()

})



#for plotting density by subject x condition
mydata2 <- mydata_skewness

by(mydata2, list(mydata2$promptRESP_RFA, mydata2$subject_ID), function(x){ dense.condition <- density(x$RTT)
i <- as.character(x$promptRESP_RFA)
cond <- i[1]
s <- as.character(x$subject_ID)
sub <- s[1]
filename <- sprintf("density_plot_%s_condition_%s.png", sub, cond)
png(filename)
d <- plot(dense.condition, filename)
print(d)
dev.off()

})




#mydata_final$RTT <- as.numeric(as.character(mydata_final$RTT))

#mydata_valid = subset(mydata, use_in_analysis == 1, select=(c(subject_ID, RTT, promptRESP_RFA)))

#subset(mydata_valid, subject_ID == "Sub10")
