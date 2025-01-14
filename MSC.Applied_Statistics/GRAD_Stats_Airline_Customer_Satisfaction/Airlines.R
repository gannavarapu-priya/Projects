rm(list=ls())
library(readr)
library(tidyverse)
library(caret)
library(party)
library(rpart)
library(rpart.plot)
library(caTools)
library(randomForest)
library(dplyr)
library(ROCR)
library(MASS)
library(psych)
library(lda)
library(plyr)
#Reading Airline Dataset 
Airline = read_csv("Desktop/R files/Airline (1).csv")
#Printing first 6 records of Airline Dataset
head(Airline)
#Printing last 6 records of Airline Dataset
tail(Airline)
#Printing dimensions of Airline Dataset
dim(Airline)
#Printing stracture of Airline Dataset
str(Airline) 
#Finding missing values 
apply(Airline, 2, function(row) sum(is.na(row)))
#Removing rows containg missing values
Airline=na.omit(Airline)

attach(Airline)

#removing unwanted variables
Airline=Airline[,-7]

barplot(table(Airline$satisfaction))

hist(Airline$Age)

#library(zoo)
#Airline=na.aggregate(Airline) use when total data is in numeric

#Replacing missing values
#converting non numeric data into numeric/integer
Airline$ADM=as.integer(Airline$ADM)
Airline$ADM[is.na(Airline$ADM)] <- mean(Airline$ADM, na.rm = TRUE) 
apply(Airline, 2, function(row) sum(is.na(row)))

summary(Airline)

#coding
Airline$Gender[Gender=="Male"]=1
Airline$Gender[Gender=="Female"]=0
Airline$Gender=as.integer(Airline$Gender)
Airline$Gender=as.factor(Airline$Gender)

Airline$CT[CT=="Loyal Customer"]=1
Airline$CT[CT=="disloyal Customer"]=0
Airline$CT=as.integer(Airline$CT)
Airline$CT=as.factor(Airline$CT)

Airline$TT[TT=="Personal Travel"]=1
Airline$TT[TT=="Business travel"]=0
Airline$TT=as.integer(Airline$TT)
Airline$TT=as.factor(Airline$TT)

Airline$Class[Class=="Eco"]=0
Airline$Class[Class=="Eco Plus"]=1
Airline$Class[Class=="Business"]=2
Airline$Class=as.integer(Airline$Class)
Airline$Class=as.factor(Airline$Class)

Airline$satisfaction=as.factor(Airline$satisfaction)

Airline$SC=as.integer(Airline$SC)
Airline$DATC=as.integer(Airline$DATC)
Airline$F_D=as.integer(Airline$F_D)
Airline$GL=as.integer(Airline$GL)
Airline$IFWS=as.integer(Airline$IFWS)
Airline$IFE=as.integer(Airline$IFE)
Airline$OS=as.integer(Airline$OS)
Airline$EOB=as.integer(Airline$EOB)
Airline$OBS=as.integer(Airline$OBS)
Airline$LRS=as.integer(Airline$LRS)
Airline$BH=as.integer(Airline$BH)
Airline$C=as.integer(Airline$C)
Airline$CS=as.integer(Airline$CS)
Airline$OB=as.integer(Airline$OB)

attach(Airline)
#Treating with outliers
boxplot(Airline)

quantile(Airline$DDM)
Airline=subset(Airline,Airline$DDM<2)
quantile(Airline$ADM)
Airline=subset(Airline,Airline$ADM<2)
Airline=subset(Airline,Airline$IFE>2)

quantile(Airline$CS)
Airline=subset(Airline,Airline$CS>=4)

boxplot(Airline)
#transformation
transformed_age=cut(Age,breaks = c(1,18,35,55,75,90),labels = c("Child","Young","Middle age","Old","Very old"))
table(transformed_age)

barplot(table(transformed_age))

barplot(table(Airline$satisfaction))

hist(Airline$Gender)

attach(Airline)
#Train set and Test set
index=sample(2,nrow(Airline),replace = TRUE,prob = c(.80,.20))
train_set=Airline[index==1,]
test_set=Airline[index==2,]

#Decision tree
library(party)
library(rpart)
library(rpart.plot)
dtree=rpart(satisfaction~.,data = train_set)
dtree
summary(dtree)
rpart.plot(dtree,extra = 4)
pre=predict(dtree,newdata=test_set,type = "class")
summary(pre)
table(pre)
confusionMatrix(test_set$satisfaction,pre)
with(dtree, pchisq(null.deviance - deviance, Airline.null-Airline.residual, lower.tail = F))

#Random Forrest
library(caTools)
library(randomForest)
set.seed(123)
RF=randomForest(satisfaction~.,data = train_set,ntree=500)
summary(RF)
predicted_values=predict(RF,newdata=test_set)
summary(predicted_values)
table(test_set$satisfaction,predicted_values)
plot(RF)
importance(RF)
varImpPlot(RF, col=c("red", "blue","green"))
#Confusion matrix
confusionMatrix(test_set$satisfaction,predicted_values)

#Logistic Regression
library(dplyr)
library(ROCR)
library(caTools)
log_reg=glm(satisfaction~.,data = train_set,family = "binomial")
log_reg
summary(log_reg)
plot(log_reg,col="yellow")
predict_reg=predict(log_reg,newdata=test_set)
predict_reg=ifelse(predict_reg>0.5,"satisfied","dissatisfied")
table(predict_reg)

table(predict_reg,test_set$satisfaction)
confusionMatrix(test_set$satisfaction,predict_reg)

plot(satisfaction~.,data=test_set,col="red")
lines(test_set$.,predict_reg,col="green",lwd=2)
with(log_reg, pchisq(null.deviance - deviance, df.null-df.residual, lower.tail = F))

#factor analysis

Airline$satisfaction[satisfaction=="dissatisfied"]=0
Airline$satisfaction[satisfaction=="satisfied"]=1
Airline$satisfaction=as.integer(Airline$satisfaction)

factanal(Airline,factors = 4)
str(Airline)

library(MASS)
library(psych)
library(lda)
pairs.panels(Airline[,1:12], gap=0, bg=c("red","blue","green")[Airline$satisfaction],ps=21)

pairs(~satisfaction+CT+Class+SC+IFWS+IFE+OS+EOB+OBS+LRS+CS+OB,Airline, main = "Scatterplot Matrix",gap=0,ps=21)

Airline_lda=lda(satisfaction~.,data=train_set)
Airline_lda
summary(Airline_lda)
pre_lda=predict(Airline_lda,test_set)$class
pre_lda
table(pre_lda)
confusionMatrix(pre_lda,test_set$satisfaction)
ldahist(pre_lda[,1],train_set$satisfaction)
plot(Airline_lda,type="both")

#svm
library(stats)
library(kernlab)
train_control <- trainControl(method="repeatedcv", number=10, repeats=10)
svm1=tra(HeartDisease~.,data=train,method ="svmPoly")
svm1
pre_svm1=predict(svm1,test_set)
table(pre_svm1)
confusionMatrix(pre_svm1,test_set$satisfaction)

Airline_svm=train(satisfaction~.,data=train_set,method="svmPoly",trControl=train_control,tuneGrid=data.frame(degree=1,
scale=1,C=1),preProcess=c("scale","center"),na.action = na.omit)
Airline_svm
summary(Airline_svm)
pre_svm=predict(Airline_svm,test_set)
summary(pre_svm)
confusionMatrix(pre_svm,test_set$satisfaction)


library(e1071)

svm2= train(satisfaction~.,data=Airline,method="nb",trControl=train_control)
svm2
summary(svm2)
pre_svm2=predict(svm2,test_set)
summary(pre_svm2)
confusionMatrix(pre_svm1,test_set$satisfaction)



yesmodel_list=list(rf=RF,glm=log_reg)
model_list1=resamples(model_list)
summary(model_list)
