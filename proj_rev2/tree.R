

library(rpart)
library(RColorBrewer)
library(rpart.plot)
library(rattle)
library(dplyr)
library(caret) 


save.tree <- function(plot, path, fname, cap, forpred){
  png(file=paste(path,fname,".png", sep=""))
  fancyRpartPlot(plot, caption = cap)
  dev.off()
  pred <- predict(plot, newdata = forpred, type="class")
  tab <- table(forpred$RESULT, pred)
  conf <- confusionMatrix(tab)
  print(paste(fname, conf$overall['Accuracy']))
  remove(pred, tab, conf)
}

games.numcols <- games[,2:9]
sample <- sample(1:nrow(games.numcols),size = ceiling(0.90*nrow(games.numcols)),replace = FALSE)
games.num <- games.numcols[sample,]
games.anum <- games.numcols[-sample,]

save.tree(rpart(RESULT~., games.num, method="class"), "./plots/trees/","all", "all", games.anum)

games.tophalf <- games.num[games.num$ELO > quantile(games.num$ELO,prob=1-50/100),]
games.tophalf.samp <- games.anum[games.anum$ELO > quantile(games.anum$ELO,prob=1-50/100),]

games.bottomhalf <- games.num[games.num$ELO <= quantile(games.num$ELO,prob=1-50/100),]
games.bottomhalf.samp <- games.anum[games.anum$ELO <= quantile(games.anum$ELO,prob=1-50/100),]

save.tree(rpart(RESULT~., games.tophalf, method="class"), "./plots/trees/split/", "top", "top half", games.tophalf.samp)
save.tree(rpart(RESULT~., games.bottomhalf, method="class"), "./plots/trees/split/", "bottom", "bottom half", games.bottomhalf.samp)

max <- 5

for (x in 1:max){
  val.top <- 1-((x-1)*(100/max))/100
  val.bottom <- 1-(x*(100/max))/100
  games.split <- games.num[games.num$ELO <= quantile(games.num$ELO, prob=val.top) & 
                          games.num$ELO >  quantile(games.num$ELO, prob=val.bottom),]
  games.split.samp <- games.anum[games.anum$ELO <= quantile(games.anum$ELO, prob=val.top) & 
                                   games.anum$ELO >  quantile(games.anum$ELO, prob=val.bottom),]
  title <- paste(val.bottom*100,"% - ", val.top*100, "%; ", min(games.split$ELO), "-", max(games.split$ELO), "; n=", nrow(games.split), sep="")
  
  save.tree(rpart(RESULT~., games.split, method="class"), "./plots/trees/split_n/", val.top*100, title, games.split.samp)
}



remove(games.num, games.bottomhalf, games.tophalf, val.top, val.bottom, x, max, title, games.split)