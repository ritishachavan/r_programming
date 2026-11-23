library(dplyr)
library(ggplot2)
library(tidyr)
file<-"C:/Users/Ritisha/Downloads/archive (1)/Titanic-Dataset.csv"
data<-read.csv(file)
#exploratory analysis
#summary stats
summary_stats<-summary(data)
print(summary_stats)
#missing values
missing_values<-colSums(is.na(data))
print(missing_values)
#plot a histogram of age by survival
print(ggplot(data,aes(x=Age))+
        geom_histogram(binwidth=5,fill="green",color="black")+
        labs(title="distribution of age",
             x="Age",
             y="Frequency"))
#data cleaning
data<-distinct(data)
#handling missing values
data$Age[is.na(data$Age)]<-mean(data$Age,na.rm=TRUE)
print(data$Age)
#filtering
adult_passengers<-filter(data,Age>18)
print(adult_passengers)
#sorting'
sorted_data<-arrange(data,desc(Fare))
print(sorted_data)
#visualization
print(boxplot(Age~Survived,data=data,col=c("blue","red"),main="Plot of age by survival"))
#t test
t_test_result<-t.test(Age~Survived,data=data)
print(t_test_result)
correlative_coefficient<-cor(data$Age,data$Fare)
print(correlative_coefficient)
#plot bar
print(ggplot(data,aes(x=factor(Survived),fill=factor(Survived)))+
        geom_bar()+
        labs(title="Survival by titanic",
             x="Survived",
             y="Count")+
             scale_fill_manual(values=c("red","green")))