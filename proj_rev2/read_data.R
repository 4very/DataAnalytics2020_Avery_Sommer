data <- read.csv("Z:/School/f2020/da/DataAnalytics2020_Avery_Sommer/proj_rev2/data/long2.csv")
fdata <- data[data$Result != "1/2-1/2" &  data$Result != "*",]

attach(fdata)

wgames <- data.frame("COLOR"="W", "ELO" = WhiteElo, "RESULT" = as.integer(substr(Result,1,1)), "P"=wp, "KN"=wkn, "B"=wb, "K"=wk, "Q"=wq, "R"=wr, "Opening"=Opening)
bgames <- data.frame("COLOR"="B", "ELO" = BlackElo, "RESULT" = as.integer(substr(Result,3,3)), "P"=bp, "KN"=bkn, "B"=bb, "K"=bk, "Q"=bq, "R"=br, "Opening"=Opening)

games <- rbind(wgames,bgames)

remove(wgames,bgames)
detach(fdata)

games.wins <- games[games$RESULT==1,]

games.losses <- games[games$RESULT==0,]