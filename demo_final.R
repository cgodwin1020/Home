
#load packages
my_packages = c("dplyr", "caret", "caTools", "RANN", "ROCR", "car", "pROC")
lapply(my_packages, require, character.only = TRUE)

#read in dataset
mydata <- read.csv("C:/Users/Christine/Documents/insight_demo/demo_final.csv")

#view first few rows
head(mydata)

#view structure of data
str(mydata)

#preparing data
#convert columns to correct type
mydata$mws_class <- as.factor(mydata$mws_class)
mydata$age <- as.numeric(mydata$age)


#review structure of data now in correct data type
str(mydata)

#remove subject column; library(dplyr)
mydata <- select(mydata, -subject)
head(mydata) #view first few rows

#check for missing values
sum(is.na(mydata))


#descriptives
summary(mydata)

#library(car)
#scatterplot matrix depicting scatterplots for each variable pair with loess lines, and
#distributions (kernel density plots) of each variable along the diagonal

scatter_names = colnames(mydata)
scatter_names = scatter_names[2:length(scatter_names)]
scatterplotMatrix(~ dan_avg + dmn_fpcn_avg + mean_enorm + creativity_score + age | mws_class, data = mydata, 
                  var.labels = scatter_names, regLine = FALSE)

#split into training and testing; library(caTools)
#set seed for reproducibility 

set.seed(101) 
sample = sample.split(mydata$mws_class, SplitRatio = .70)
trainset = subset(mydata, sample == TRUE)
testset  = subset(mydata, sample == FALSE)



#run logistic regression analysis on training set; use k-fold cross validation with 10 folds
ctrl <- trainControl(method = "repeatedcv", number = 10, savePredictions = TRUE)
model_fit <- train(mws_class ~ dan_avg + dmn_fpcn_avg + mean_enorm + creativity_score + age,  
                   data=trainset, method="glm", family="binomial", trControl = ctrl)


#inspect model
model_fit
summary(model_fit)
model_fit$results

#variable importance
varImp(object=model_fit)
plot(varImp(object=model_fit),main="Logistic Regression - Variable Importance")


#examining vif to test for multicollinearity
model_fit2 <- model_fit #making a copy for the next step
model_fit2$finalModel$call[[1]] <- "glm" #do this because vif function requires object from glm function
vif(model_fit2$finalModel)


#run on test data
pred = predict(model_fit, newdata=testset)
pred_prob = predict(model_fit, newdata = testset, type = "prob") #calculating probabilities
conf_matrix <- confusionMatrix(data=pred, testset$mws_class, positive = "1")



#####
######
######

#follow up, examine most important features from last analysis

mydata2 <- read.csv("C:/Users/Christine/Documents/insight_demo/followup.csv")
mydata2$mws_class <- as.factor(mydata2$mws_class)
mydata2 <- select(mydata2, -subject)


#split into training and testing; library(caTools)
#set seed for reproducibility 

set.seed(102) 
sample = sample.split(mydata2$mws_class, SplitRatio = .70)
trainset2 = subset(mydata2, sample == TRUE)
testset2  = subset(mydata2, sample == FALSE)

#run logistic regression analysis on training set; use k-fold cross validation with 10 folds
ctrl <- trainControl(method = "repeatedcv", number = 10, savePredictions = TRUE)
model_fit2 <- train(mws_class ~ ., data=trainset2, method="glm", family="binomial", trControl = ctrl)
summary(model_fit2)
model_fit2$results

#run on test data
pred2 = predict(model_fit2, newdata=testset2)
pred_prob2 = predict(model_fit2, newdata = testset2, type = "prob") #calculating probabilities
conf_matrix2 <- confusionMatrix(data=pred2, testset2$mws_class)


#compare both models using glm function
#use 'Anova' function with type 2 sums of squares
first_model <- glm(mws_class ~ ., data=trainset, family="binomial")
Anova(first_model)
second_model <- glm(mws_class ~., data=trainset2, family="binomial")
Anova(second_model)
library(zoo)
library(lmtest)
#likelihood ratio test
lrtest(second_model, first_model)

library(pscl)
#review pseudo r2 (mcfadden)
pR2(first_model)
pR2(second_model)


######
######
######

#general linear model
mydata_lm <- read.csv("C:/Users/Christine/Documents/insight_demo/lm_version.csv")

set.seed(102) 
sample = sample.split(mydata_lm$mws_score, SplitRatio = .70)
trainset_lm = subset(mydata_lm, sample == TRUE)
testset_lm  = subset(mydata_lm, sample == FALSE)


lm_1 <- lm(trainset_lm$mws_score ~ dan_avg + dmn_fpcn_avg + mean_enorm + creativity_score + age, data = trainset_lm)
summary(lm_1)
resid_plot <- plot(lm_1, 1)
qq_plot <- plot(lm_1, 2)

lm_2 <- lm(trainset_lm$mws_score ~ dmn_fpcn_avg + creativity_score, data = trainset_lm)
summary(lm_2)
anova(lm_1, lm_2)


lm_all <- lm(mydata_lm$mws_score ~ dan_avg + dmn_fpcn_avg + mean_enorm + creativity_score + age, data = mydata_lm)
summary(lm_all)

lm2_all <- lm(mydata_lm$mws_score ~ dmn_fpcn_avg + creativity_score, data = mydata_lm)
summary(lm2_all)
anova(lm_all, lm2_all)


####
####
####

#boxplots for each feature x mws class
library(ggplot2)
ggplot(aes(x = mydata$mws_class, y = mydata$dan_avg), data = mydata) + geom_boxplot()
ggsave("boxplot_dan.png", width = 4, height = 4)
ggplot(aes(x = mydata$mws_class, y = mydata$dmn_fpcn_avg), data = mydata) + geom_boxplot()
ggsave("boxplot_dmn_fpcn.png", width = 4, height = 4)
ggplot(aes(x = mydata$mws_class, y = mydata$mean_enorm), data = mydata) + geom_boxplot()
ggsave("boxplot_enorm.png", width = 4, height = 4)
ggplot(aes(x = mydata$mws_class, y = mydata$creativity_score), data = mydata) + geom_boxplot()
ggsave("boxplot_creativity.png", width = 4, height = 4)
ggplot(aes(x = mydata$mws_class, y = mydata$age), data = mydata) + geom_boxplot()
ggsave("boxplot_age.png", width = 4, height = 4)



###
###
#bootstrapping original model
ctrl_boot <- trainControl(method="boot", number=100)
model_boot_fit <- train(mws_class ~ dan_avg + dmn_fpcn_avg + mean_enorm + creativity_score + age,  
                   data=trainset, method="glm", family="binomial", trControl = ctrl_boot)
summary(model_boot_fit)


pred_boot = predict(model_boot_fit, newdata=testset)
pred_boot_prob = predict(model_boot_fit, newdata = testset, type = "prob") #calculating probabilities
conf_matrix_boot <- confusionMatrix(data=pred_boot, testset$mws_class, positive = "1")







#####
#including this as an option to run; validity of use of ROC curves in machine learning is debated
# Compute AUC and generate ROC curve
#library(ROCR)
obs <- testset$mws_class
auc_obj <- roc(as.numeric(obs), as.numeric(pred))
auc(auc_obj)


probs <- pred_prob[,2]
probs2 <- prediction(probs, testset$mws_class)
perform <- performance(probs2, measure = "tpr", x.measure = "fpr") 
plot(perform)



