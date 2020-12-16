
library(ggcorrplot)
library(ggplot2)

games.wins.data <- games.wins[,2:9]
games.losses.data <- games.losses[,2:9]


plot <- ggcorrplot(cor(games.wins.data), title="Wins",
                   type = "lower",
                   lab = TRUE,
                   ggtheme = ggplot2::theme_minimal())
ggsave("./plots/corrplot/wl/wins.png", plot=plot)


plot <- ggcorrplot(cor(games.losses.data), title="losses",
                   type = "lower",
                   lab = TRUE,
                   ggtheme = ggplot2::theme_minimal())
ggsave("./plots/corrplot/wl/losses.png", plot=plot)



remove(games.losses.data, games.wins.data, plot)