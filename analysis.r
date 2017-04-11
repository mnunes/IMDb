library(ggplot2)
library(dplyr)

###################
### Game of Thrones

# ler e combinar os dados

got.season  <- scan(file="got.season.dat")
got.episode <- scan(file="got.episode.dat")
got.rating  <- scan(file="got.rating.dat")

got           <- cbind(got.season, got.episode, got.rating)
got           <- data.frame(got)
colnames(got) <- c("temporada", "episodio", "rating")

ordem <- sort(got.season*100 + got.episode, index.return=TRUE)$ix

got           <- got[ordem, ]
got$episodio  <- 1:dim(got)[1]
got$temporada <- as.character(got$temporada)

head(got)

# plots

ggplot(got, aes(x=episodio, y=rating, color=temporada)) + 
  labs(title="Game of Thrones: Ratings por Temporada", x="Episódio", y="Rating", colour="Temporada") + 
  geom_smooth(method=lm, se=FALSE) + 
  geom_point(shape=1) +
  theme(plot.title = element_text(hjust = 0.5))

got %>%
  select(temporada, rating) %>%
  group_by(temporada) %>%
  summarise(media=mean(rating), mediana=median(rating), desvPad=sd(rating), maximo=max(rating), episodio_max=which.max(rating), minimo=min(rating), episodio_min=which.min(rating))
  
ggplot(got, aes(x=temporada, y=rating, color=temporada)) + 
  labs(title="Game of Thrones: Ratings por Temporada", x="Temporada", y="Rating", colour="Temporada") + 
  geom_boxplot() +
  theme(plot.title = element_text(hjust = 0.5))

####################
### The Walking Dead

# ler e combinar os dados

twd.season  <- scan(file="twd.season.dat")
twd.episode <- scan(file="twd.episode.dat")
twd.rating  <- scan(file="twd.rating.dat")

twd           <- cbind(twd.season, twd.episode, twd.rating)
twd           <- data.frame(twd)
colnames(twd) <- c("temporada", "episodio", "rating")

ordem <- sort(twd.season*100 + twd.episode, index.return=TRUE)$ix

twd           <- twd[ordem, ]
twd$episodio  <- 1:dim(twd)[1]
twd$temporada <- as.character(twd$temporada)

head(twd)

# plots

ggplot(twd, aes(x=episodio, y=rating, color=temporada)) + 
  labs(title="The Walking Dead: Ratings por Temporada", x="Episódio", y="Rating", colour="Temporada") + 
  geom_smooth(method=lm, se=FALSE) + 
  geom_point(shape=1) +
  theme(plot.title = element_text(hjust = 0.5))

twd %>%
  select(temporada, rating) %>%
  group_by(temporada) %>%
  summarise(media=mean(rating), mediana=median(rating), desvPad=sd(rating), maximo=max(rating), episodio_max=which.max(rating), minimo=min(rating), episodio_min=which.min(rating))

ggplot(twd, aes(x=temporada, y=rating, color=temporada)) + 
  labs(title="The Walking Dead: Ratings por Temporada", x="Temporada", y="Rating", colour="Temporada") + 
  geom_boxplot() +
  theme(plot.title = element_text(hjust = 0.5))

