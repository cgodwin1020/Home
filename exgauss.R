
#package retimes
library(retimes)

exgauss_list <- list()

by(mydata_skewness, list(mydata_skewness$promptRESP_RFA, mydata_skewness$subject_ID), function(x){ i <- as.character(x$promptRESP_RFA)
cond <- i[1]
s <- as.character(x$subject_ID)
sub <- s[1]
plot_filename <- sprintf("exgauss_%s_condition_%s.png", sub, cond)
png(plot_filename)
exgauss <- timefit(x$RTT, iter = 1000, plot = TRUE)
dev.off()
data_filename <- sprintf("ex_gauss_%s_condition_%s.RData", sub, cond)
save(exgauss, file = data_filename)
mu_value <- exgauss@par[1]
sigma_value <- exgauss@par[2]
tau_value <- exgauss@par[3]
logLik <- exgauss@logLik
AIC <- exgauss@AIC
BIC <- exgauss@BIC
exgauss_df <- c(subject_name = sub, condition_type = cond, mu_value = mu_value, sigma_value = sigma_value, tau_value = tau_value, logLik = logLik, AIC = AIC, BIC = BIC)
current_list <- list(exgauss_df)
exgauss_list <<- append(exgauss_list, current_list)
})






