library(ggplot2)
library(dplyr)
library(plotly)
flight_data<-read.csv("C:/Users/Ritisha/Downloads/archive/Clean_Dataset.csv")
head(flight_data)
tail(flight_data)
bar_plot<-ggplot(flight_data,aes(x=airline,fill=stops))+
  geom_bar(position="dodge")+
  labs(title="Flight count by airline",
       x="airline",
       y="count",
       fill="stops")+
  theme(axis.text.x=element_text(angle=45,hjust=1))
print(bar_plot)
line_plot<-ggplot(flight_data,aes(x=price,y=..density..))+
  geom_density(fill="green",alpha=0.5)+
  labs(title="flight price distribution",
       x="price",
       y="density")
print(line_plot)
interactive_plot_bar<-ggplotly(bar_plot)
interactive_plot_line<-ggplotly(line_plot)
interactive_plot_bar
interactive_plot_line
ggsave("flightcount.png",plot=bar_plot,width=8,height=6)
ggsave("flightprice.png",plot=line_plot,width=8,height=6)