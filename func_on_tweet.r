# Clean the tweets and returns merged data frame
result = score.sentiment(sample, pos.words, neg.words)
library(dplyr)
library(reshape)
test1=result[[1]]
test2=result[[2]]
test3=result[[3]]

#Creating three different data frames for Score, Positive and Negative
#Removing text column from data frame
test1$text=NULL
test2$text=NULL
test3$text=NULL
#Storing the first row(Containing the sentiment scores) in variable q
q1=test1[1,]
q2=test2[1,]
q3=test3[1,]
qq1=melt(q1, ,var='Score')
qq2=melt(q2, ,var='Positive')
qq3=melt(q3, ,var='Negative') 
qq1['Score'] = NULL
qq2['Positive'] = NULL
qq3['Negative'] = NULL
#Creating data frame
table1 = data.frame(Text=result[[1]]$text, Score=qq1)
table2 = data.frame(Text=result[[2]]$text, Score=qq2)
table3 = data.frame(Text=result[[3]]$text, Score=qq3)


#Merging three data frames into one
table_final=data.frame(Text=table1$Text, Score=table1$value, Positive=table2$value, Negative=table3$value)
Negative=table3$value
Score=table1$value
Positive=table2$value



table_final1=data.frame(Text=table1$Text, Score=table1$value, Positive=table2$value, Negative=table3$value,IMP=NA)
table_final1$IMP <- ifelse(table_final1$Score>0, "posi",
                           ifelse(table_final1$Score<0,"negati","neu")
)
table_final1$IMP<-as.factor(table_final1$IMP)
write.csv(table_final1,file="mydata.csv")


library(e1071)
mydata<-read.csv("MyData.csv",header=T)
mydata
nrow(mydata)
data<-sample(2,nrow(mydata),replace=T)
train<-mydata[1:600,]
test<-mydata[601:100,]
nrow(train)
train
nb<-naiveBayes(IMP~.,mydata)
nb
test<-read.csv("MyData.csv", header=T)
pred<-predict(nb,test,type="class")
class(pred)
pred
test$IMP
class(test$IMP)
table(pred,test$IMP,dnn=c("Predicted","Actual"))

library(caret)
conf <- confusionMatrix(pred, test$IMP)
conf

conf$byClass

conf$overall

# Prediction Accuracy
conf$overall['Accuracy']

plot(pred,test$IMP)

library(ggplot2)
qplot(pred)

#pie
library(plotrix)
piepercent<- round(100*table(table_final1$IMP)/sum(table(table_final1$IMP)), 1)
pie3D(table(pred), labels = piepercent, main = "Sentimental Analysis",col = rainbow(length(table(table_final1$IMP))))
legend("topright", c("Negative","Neutral","Positive"), cex = 0.6,
       fill = rainbow(length(table(table_final1$IMP))))



