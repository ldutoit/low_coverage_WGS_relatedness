# Two distributions representing the distribution of genotype depth in a low and a high coverage individual
library(ggplot2)

set.seed(123)

df <- data.frame(
  value = c(
    rnorm(100000, mean = 5, sd = 4),
    rnorm(100000, mean = 20, sd = 4)
  ),
  group = rep(c("5", "20"), each = 100000)
)

ggplot(df, aes(x = value, fill = group)) +
  geom_density(alpha = 0.5, show.legend = FALSE) +  # hide legend
  geom_vline(xintercept = 8, linetype = "dashed", linewidth = 1) +
  labs(
    x = "Depth",
    y = "Density"
  ) +
  theme_minimal() +
  theme(legend.position = "none")  # also hides legend just in case
ggsave("img/depth_distribtutions.png")
