library(dplyr)
library(ggplot2)
library(tidyr)
file_path<-"C:/Users/Ritisha/Downloads/archive (1)/Titanic-Dataset.csv"
data<-read.csv(file_path)

summary_stats<-summary(data)
print(summary_stats)

print(ggplot(data,aes(x=Age))+
        geom_histogram(binwidth = 5,fill="blue",color="black")+
        labs(title = "the distribution of age on titanic",
             x="Age",
             y="frequency"))
missing_value<-colSums(is.na(data))
print(missing_value)

data<-distinct(data)
data

data$Age[is.na(data$Age)]<-mean(data$Age,na.rm=TRUE)
missing_value<-colSums(is.na(data))
print(missing_value)
adult_passenger<-filter(data,Age>18)
adult_passenger
sorted_titanic<-arrange(data,desc(Fare))
sorted_titanic
print(boxplot(Age~Survived,data=data,col=c("red","blue"),main="The boxplot of age survived"))
t_test_result<-t.test(Age~Survived,data=data);
print(t_test_result)
correlation_coefficient<-cor(data$Age,data$Fare)
print("correlation_coefficient")

print(ggplot(data,aes(x=factor(Survived),fill=factor(Survived)))+
        geom_bar()+
        labs(title="Number of survivors on titanic",
             x="Survived",
             y="Count")+
        scale_fill_manual(values=c("red","green")))