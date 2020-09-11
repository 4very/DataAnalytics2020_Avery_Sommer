

water_data <- read.csv("Z:\\School\\f2020\\da\\DataAnalytics2020_Avery_Sommer\\lab1\\water-treatment.csv")

cond.E_f <- water_data$COND.E[!is.na(water_data$COND.E)]
cond.P_f <- water_data$COND.P[!is.na(water_data$COND.P)]
cond.D_f <- water_data$COND.D[!is.na(water_data$COND.D)]

xlim_max <- max(cond.E_f, cond.P_f, cond.D_f)
xlim_min <- min(cond.E_f, cond.P_f, cond.D_f)

plot(0,0, xlim = c(xlim_min,xlim_max), ylim = c(0,1), verticals=TRUE, type="n", )

lines(ecdf(cond.E_f),col = rainbow(5)[1],type = 'b', do.points=FALSE)
lines(ecdf(cond.P_f),col = rainbow(5)[3],type = 'b', do.points=FALSE)
lines(ecdf(cond.D_f),col = rainbow(5)[4],type = 'b', do.points=FALSE)
