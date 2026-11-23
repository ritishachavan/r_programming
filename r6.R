library(dplyr)
library(tidyr)
library(ggplot2)
departments<-read.csv("C:/Users/Ritisha/Downloads/archive (2)/departments.csv")
mgr_dpt<-read.csv("C:/Users/Ritisha/Downloads/archive (2)/dept_manager.csv")
merged_data<-merge(departments,mgr_dpt,by="dept_no")
print(merged_data)
salaries<-read.csv("C:/Users/Ritisha/Downloads/archive (2)/salaries.csv")
summary_stats<-summary(salaries)
aggregated_data<-salaries%>%
  group_by(emp_no)%>%
  summarize(
    total=sum(salary),
    average=mean(salary),
    Experience=n()
  )
print("Aggregated data:Emp no, Total salary, Average salary, Number of years of service")
print(aggregated_data)
filtered_data<-filter(salaries,salary>14000)
print(filtered_data)
transformed_data<-salaries%>%
  mutate(
    salary=salary*1.5,
    seniority=ifelse(salary>75000,"Senior","Junior")
  )
print(transformed_data)
