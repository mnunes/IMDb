# read the data and combine the columns

got.season  <- scan(file="got.season.dat")
got.episode <- scan(file="got.episode.dat")
got.rating  <- scan(file="got.rating.dat")

got           <- cbind(got.season, got.episode, got.rating)
got           <- data.frame(got)
colnames(got) <- c("Temporada", "Episode", "Rating")

ordem <- sort(got.season*100 + got.episode, index.return=TRUE)$ix

got      <- got[ordem, ]
got[, 1] <- as.character(got[, 1])

# plots

library(ggplot2)

#qplot(1:length(ordem), Rating, data=twentyfour, color=Season, xlab="Episode", ylab="Rating", main="24 Ratings by Season")

Episódios = 1:length(ordem)

ggplot(got, aes(x=Episódios, y=Rating, color=Temporada), xlab="Episódio", ylab="Rating", main="Game of Thrones Ratings por Temporada") + geom_smooth(method=lm,se=FALSE) + geom_point(shape=1, solid=TRUE)

ggplot(got, aes(x=Episódios, y=Rating, color=Temporada), xlab="Episódio", ylab="Rating", main="Game of Thrones Ratings por Temporada") + geom_smooth(method=loess,se=FALSE) + geom_point(shape=1, solid=TRUE)
