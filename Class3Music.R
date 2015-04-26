#bring in data
music_all <- read.csv("music-all.csv")

#replace all NAs with 0
music_all[is.na(music_all)] <- 0

#get rid of non-numeric columns
music_all1 = music_all[c(4:73)]

#use prcomp to find principal components of song attributes
music_prcomp <- prcomp(music_all1, retx = TRUE, scale. = TRUE)

#plot the standard deviation
plot(music_prcomp$sdev)

#scatterplot of the first 2 principal components
library(ggplot2)

rotated_data <- data.frame(music_prcomp$x)
rotated_data$artist = music_all$artist

ggplot(data = rotated_data, aes(x = PC1, y = PC2)) + geom_text(label = rotated_data$artist) 
