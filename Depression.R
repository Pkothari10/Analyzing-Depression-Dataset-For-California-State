library(tidyverse)
library(ggplot2)
Adult_depression <- read.csv(file = "/Users/prakrutikothari/Downloads/Adult_Depression.csv")
head(Adult_depression)
dim(Adult_depression)
str(Adult_depression)
Year<- read.csv(file = "/Users/prakrutikothari/Downloads/Year.csv")
Gender<- read.csv(file = "/Users/prakrutikothari/Downloads/Male1.csv")
Age<- read.csv(file = "/Users/prakrutikothari/Downloads/Age.csv")
Education<- read.csv(file = "/Users/prakrutikothari/Downloads/Education.csv")
Income<- read.csv(file = "/Users/prakrutikothari/Downloads/Income.csv")
Race<- read.csv(file = "/Users/prakrutikothari/Downloads/Race-Ethnicity.csv")
head(Race)
head(Gender)

summary(Adult_depression)
class(Adult_depression)



#########Plot for year wise Frequency##############

ggplot(Year, aes(x =Year, y =Frequency)) +
  geom_bar(stat='identity',
    fill = "pink",
    color = "black",
  ) +
  labs(x = "Year",
       y="Frequency",
       title = "Year wise Frequency")



###############Gender wise Frequency plot###########
ggplot(Gender, aes(x=Year,y= Frequency,fill=StrataName))+
  geom_bar(stat='identity')+
  labs(x="Year",
       y="Frequency",
       title="Gender wise frequency",
       fill="Gender")+
  scale_fill_manual(
    values=c("pink","yellow"))+
  facet_wrap(~StrataName)



###############Age wise Frequency plot###########
head(Age)

ggplot(Age,aes(x=Year,y= Frequency,fill=StrataName))+
  geom_bar(stat='identity',color = "black")+
  labs(x="Year",
       y="Frequency",
       title="Age wise Frequency")+
  scale_fill_manual(
    values=c("pink","yellow1","plum1","seagreen2","steelblue1"))+
  facet_wrap(~StrataName)+
  theme_gray()+ theme(
    plot.title=element_text(hjust=0.5),
    plot.subtitle=element_text(hjust=0.5),
    plot.caption=element_text(hjust=-.5),
    
    #  strip.text.y = element_blank(),
    strip.background=element_rect(fill=rgb(.9,.95,1),
                                  colour=gray(.5), size=.2),
    
    panel.border=element_rect(fill=FALSE,colour=gray(.70)),
    panel.grid.minor.y = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.spacing.x = unit(0.10,"cm"),
    panel.spacing.y = unit(0.05,"cm"),
  )
  
###############Education wise Frequency plot########### 
head(Education)

ggplot(Education, aes(x=Year,y= Frequency,fill=StrataName))+
    geom_bar(stat='identity',color = "black")+
    labs(x="Year",
         y="Frequency",
         title="Education level",
         fill="Education")+
    scale_fill_manual(
      values=c("pink","yellow","plum1","steelblue1"))+
    facet_wrap(~StrataName)

###############Income wise Frequency plot###########
head(Income)
ggplot(Income, aes(x=Year,y= Frequency,fill=StrataName))+
  geom_bar(stat='identity',color = "black")+
  labs(x="Year",
       y="Frequency",
       title="Income wise Frequency",
       fill="Income")+
  scale_fill_manual(
    values=c("pink","yellow1","plum1","steelblue1","seagreen2","tan1"))+
  facet_wrap(~StrataName)+
  theme_gray()+ theme(
    plot.title=element_text(hjust=0.5),
    plot.subtitle=element_text(hjust=0.5),
    plot.caption=element_text(hjust=-.5),
    
    #  strip.text.y = element_blank(),
    strip.background=element_rect(fill=rgb(.9,.95,1),
                                  colour=gray(.5), size=.2),
    
    panel.border=element_rect(fill=FALSE,colour=gray(.70)),
    panel.grid.minor.y = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.spacing.x = unit(0.10,"cm"),
    panel.spacing.y = unit(0.05,"cm"),
    
  )


###############Race wise Frequency plot###########
ggplot(Race, aes(x=Year,y= Frequency,fill=StrataName))+
  geom_bar(stat='identity',color = "black")+
  labs(x="Year",
       y="Frequency",
       title="Race wise Frequency",
       fill="Race-Ethnicity")+
  scale_fill_manual(
    values=c("pink","yellow","plum1","steelblue1","seagreen2"))+
  facet_wrap(~StrataName)+
  theme_gray()+ theme(
    plot.title=element_text(hjust=0.5),
    plot.subtitle=element_text(hjust=0.5),
    plot.caption=element_text(hjust=-.5),
    
    #  strip.text.y = element_blank(),
    strip.background=element_rect(fill=rgb(.9,.95,1),
                                  colour=gray(.5), size=.2),
    
    panel.border=element_rect(fill=FALSE,colour=gray(.70)),
    panel.grid.minor.y = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.spacing.x = unit(0.10,"cm"),
    panel.spacing.y = unit(0.05,"cm"),
    
  )

##############Linear Regression Modeel

library(readxl)
Year<- read.csv(file = "/Users/prakrutikothari/Downloads/Year.csv")
head(Year)
lmYear = lm(Year~Frequency, data = Year) 
summary(lmYear)


ggplot(data = Year, aes(x = Year, y = Frequency)) +
  geom_point() +
  stat_smooth(method = "lm", col = "dodgerblue3") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

pred_grid <- expand.grid(Year= Year,  Frequency = Frequency)






  
  