library(ggplot2)
library(gganimate)


snail_data <- read.table('snail_data.txt',header=FALSE,sep='\t') #reading data 

snail_data$V3 <- as.factor(snail_data$V3)# converting the column with data groups to factor

p <- ggplot(snail_data, aes(x = V1, y = V2)) + geom_point(size=3,col="purple4")+
  theme_void()#plotting data points V2 vs. V1



anim <- p + 
  transition_states(V3,
                    transition_length =1,
                    state_length = 0.5)#creating the animation with frames grouped by values of V3 

#saving the animation as a .gif file
anim_save("snail-animation.gif",animation=last_animation(),path="path_to_the_project/snail-data-animation")

