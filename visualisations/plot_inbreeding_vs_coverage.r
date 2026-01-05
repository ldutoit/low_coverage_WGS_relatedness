## Quick visualisation to illustrate the relationship between individual coverage and inbreeding coefficient
## Randomly generated data
set.seed(123)

library(ggplot2)

n <- 400
z <- sort(rnorm(n))

# Individual coverage (soft asymptote)
coverage <- 20 * (1 - exp(-0.12 * (z - min(z))))
# Mean inbreeding curve (bounded naturally below 0.4)
mu <- 0.2 + 0.35 * exp(-0.25 * coverage)
# Heteroskedastic noise: more variance at low coverage
noise_sd <- 0.08 + 0.12 * exp(-0.4 * coverage)
inbreeding <- mu + rnorm(n, sd = noise_sd)
# no inbreeding below 0
inbreeding[inbreeding < 0] <- 0

df <- data.frame(
  coverage   = coverage,
  inbreeding = inbreeding
)



ggplot(df, aes(x = coverage, y = inbreeding)) +
  geom_point(
    size = 2.6,
    alpha = 0.85,
    colour = "#2C7FB8"   # soft blue
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    linewidth = 1.2,
    colour = "#D95F02"   # warm orange
  ) +
  scale_x_continuous(
    limits = c(0, 12.5),
    expand = expansion(add = c(0.3, 0.3))
  ) +
  scale_y_continuous(
    limits = c(0, 0.5),
    expand = expansion(add = c(0.02, 0.02))
  ) +
  labs(
    x = "Individual coverage",
    y = "Inbreeding coefficient"
  ) +
  theme_classic(base_size = 13) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black"),
    axis.line = element_line(linewidth = 0.8),
    plot.margin = margin(10, 10, 10, 10)
  )
ggsave("img/corcoverageinbreeding.png")
