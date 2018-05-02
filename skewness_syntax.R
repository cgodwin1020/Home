library(e1071)

#load mydata_skewness with 2206 obs of 3 variables
sd <- mydata_skewness

#d = vector of RTT values from each condition per subject
#calculating standard error of skewness as in SPSS
skew_se_function <- function(d) {
  n <- length(d)
  g1 <- sqrt((6*(n-2))/((n+1)*(n+3)))
  skew_g1 <- ((sqrt(n*(n-1)))/(n-2)) * g1
  return(skew_g1)
  
}


skewness_list <- list()
  

by(sd, list(sd$promptRESP_RFA, sd$subject_ID), function(x){ skew_type2 <- skewness(x$RTT, type = 2)
  skew_se <- skew_se_function(x$RTT)
  i <- as.character(x$promptRESP_RFA)
  condition <- i[1]
  s <- as.character(x$subject_ID)
  subject <- s[1]
  skewness_df <- c(subject_name = subject, condition_type = condition, skew_type2_value = skew_type2, skew_se_value = skew_se)
  current_df <- skewness_df
  current_list <- list(current_df)
  skewness_list <<- append(skewness_list, current_list)
})



