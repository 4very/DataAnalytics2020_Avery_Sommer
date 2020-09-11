library(ISLR)

data("Auto")
head(Auto,15)

summary(Auto)
names(Auto)

fivenum(Auto$mpg)
boxplot(Auto$mpg, title=title("MPG"))

boxplot(Auto$weight, title=title("Weight"))
mean(Auto$weight)
median(Auto$weight)