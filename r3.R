library(ggplot2)
library(dplyr)
library(plotly)
titanic<-read.csv("C:/Users/Ritisha/Downloads/titanic.csv")
titanic
titanic$Survived<-factor(titanic$Survived,levels=c("0","1"))
titanic$Survived

p<-ggplot(titanic,aes(x=Pclass, fill=factor(Survived)))+
  geom_bar(position="dodge")+
  labs(title="survival by passenger class",
       x="Passeger class",
       y="count",
       fill="Survived")+
  theme_minimal()+
  scale_y_continuous(expand=c(0,0))
print(p)

interactive_plot<-ggplotly(p,tooltip=c("x","y","fill"))
interactive_plot<-interactive_plot%>%
  layout(title="interactive plot")
interactive_plot

ggsave("titanic_survived.png",plot=p,width=8,height=6)
ggsave("titanic_survived.pdf",plot=p,width=8,height=6)
htmlwidgets::saveWidget(interactive_plot,"titanic_survived.html")