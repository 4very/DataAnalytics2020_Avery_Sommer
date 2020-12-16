library(corrplot)
library(ggplot2)
library(ggcorrplot)

save.plot <- function(data, path, fname, cap){
  plot <- ggcorrplot(cor(data), title = cap,
                     type = "lower",
                     lab = TRUE,
                     ggtheme = ggplot2::theme_minimal(), tl.col="white")
  ggsave(paste(path,fname,".png", sep=""), plot = plot)
}




games.num <- games[,2:9]


save.plot(games.num, "./plots/corrplot/", "total", "All Games")

games.tophalf <- games.num[games.num$ELO > quantile(games.num$ELO,prob=1-50/100),]
games.bottomhalf <- games.num[games.num$ELO <= quantile(games.num$ELO,prob=1-50/100),]

save.plot(games.tophalf, "./plots/corrplot/split/", "thalf", paste("Top half of ELO; ", min(games.tophalf$ELO), "-", max(games.tophalf$ELO), sep=""))
save.plot(games.bottomhalf, "./plots/corrplot/split/", "bhalf", paste("Bottom half of ELO; ", min(games.bottomhalf$ELO), "-", max(games.bottomhalf$ELO), sep=""))

plot <- ggcorrplot(cor(games.bottomhalf)-cor(games.tophalf), type = "lower",
                   title = "Bottom half - Top half",
                   lab = TRUE,
                   ggtheme = ggplot2::theme_minimal())
ggsave("./plots/corrplot/split/diff.png", plot=plot)

max <- 5

for (x in 1:max){
  val.top <- 1-((x-1)*(100/max))/100
  val.bottom <- 1-(x*(100/max))/100
  data.var <- games.num[games.num$ELO <= quantile(games.num$ELO, prob=val.top) & 
                        games.num$ELO >  quantile(games.num$ELO, prob=val.bottom),]
  title <- paste(val.bottom*100,"% - ", val.top*100, "%; ", min(data.var$ELO), "-", max(data.var$ELO), "; n=", nrow(data.var), sep="")
  
  save.plot(data.var, "./plots/corrplot/4sec/", (x)*(100/max), paste(min(data.var$ELO), "-", max(data.var$ELO), "; ", 
                                                                     val.bottom*100, "%-", val.top*100, "%", sep=""))
  
}


for (x in 3:15){
  val <- x * 200
  data.use <- games.num[games.num$ELO >= val & games.num$ELO < val+199,]
  title <- paste(val, "-", val+199, ": n = ", nrow(data.use),sep="")
  
  save.plot(data.use, "./plots/corrplot/inc200/", val, paste(min(data.use$ELO), "-", max(data.use$ELO)))
  
  
}

# all variables
remove(max, title, val, val.bottom, val.top, x, plot)

# all df
remove(games.bottomhalf, games.tophalf, games.num, data.use, data.var)


