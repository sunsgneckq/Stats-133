##title: Shot Charts
##description:Visualize the data by putting the made shots and missed shots together on basketball court. Then we can see each player's preferable shot position and time. 
##input: andre-iguodala.csv,draymond-green.csv,kevin-durant.csv,klay-thompson.csv,stephen-curry.csv
##output: shots-data.csv

setwd('/Users/sunsgne/Desktop/Stat133/hw-stat133/hw02')
 
library('grid')
library('jpeg')
library('ggplot2')
library("gridExtra")
library('dplyr')
dat<- read.csv('data/shots-data.csv',stringsAsFactors = FALSE, na.strings = "?")
curry<- filter(dat, name=="Stephen Curry")
green<- filter(dat, name=="Draymond Green")
thompson<- filter(dat, name=="Klay Thompson")
andre<- filter(dat, name=="Andre Iguodala")
durant<- filter(dat, name=="Kevin Durant")
 

#4.1) Create shot charts (with court backgrounds) for each player, and save the plots in PDF format, with dimensions width = 6.5 and height = 5 inches, inside the folder images/:
court_file <- "images/nba-court.jpg" 
court_image <- rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))
andre_shot_chart <- ggplot(data = andre) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
ggsave('images/andre-iguodala-shot-chart.pdf',width = 6.5, height = 5)
green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond green (2016 season)') + theme_minimal()
ggsave('images/draymond-green-shot-chart.pdf',width = 6.5, height = 5)
durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50,420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
ggsave('images/kevin-durant-shot-chart.pdf',width = 6.5, height = 5)
klay_thompson_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
ggsave('images/klay-thompson-shot-chart.pdf',width = 6.5, height = 5)
curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen curry(2016 season)') + theme_minimal()
ggsave('images/stephen-curry-shot-chart.pdf',width = 6.5, height = 5)

#4.2) 
P1 <- ggplot(data = andre) + annotation_custom(court_image, -250, 250, -50, 420) + ylim(-50, 420) +geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ggtitle('Andre Iguodala') +theme_minimal()+theme(plot.title = element_text(hjust=0.5))
P2 <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + ylim(-50, 420)+geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ggtitle('Draymond Green') + theme_minimal()+theme(plot.title = element_text(hjust=0.5))
P3<- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + ylim(-50,420)+geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ggtitle('Kevin Durant') + theme_minimal()+theme(plot.title = element_text(hjust=0.5))
P4 <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420)+ ylim(-50, 420) +geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ggtitle('Klay Thompson') + theme_minimal()+theme(plot.title = element_text(hjust=0.5))
P5 <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + ylim(-50, 420)+geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ggtitle('Stephen curry') + theme_minimal()+theme(plot.title = element_text(hjust=0.5))

P6 <- ggplot(data = dat) + annotation_custom(court_image, -250, 250, -50, 420) + ylim(-50, 420)+geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ggtitle('Shot Charts: GSW(2016 season)') + theme_minimal()+facet_wrap(~name)
ggsave('images/gsw-shot-charts.pdf',width = 8, height = 7)


 
              