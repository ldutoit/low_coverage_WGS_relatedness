# This short script simulates sampling randomly alleles with every read at different depth.
# We assume alleles are randomly sampled and excluding PCR bias.
set.seed(123)

#Defining a position with two alleles, A and T
genotype <- c("A","T")

prop_pos_missed_allele<-c() # a vector which will store the proportion of positions with a missed allele
for (depth in 1:20){ # for depth varying from 1 to 20
  print(depth)
  heterozygotes<-c() # store whether the genotype has been identified as heterozygotes
  for (sampling_alleles in 1:100000){ # samples one hundred thousand times a genotype at that depth
    heterozygotes[sampling_alleles] <- length(levels(as.factor(sample(genotype,depth,replace=T)  )))==2 # 2 is heterozygote, one is homozygote return TRUE or FALSE
  }
  prop_pos_missed_allele[depth]<-(100000-sum(heterozygotes))/100000 # proportion of genotypes with missed alleles
}

# Plotting 
library(ggplot2)

df <- data.frame(
  coverage = 1:20,
  prop_pos_missed_allele = prop_pos_missed_allele
)

ggplot(df, aes(x = coverage, y = prop_pos_missed_allele)) +
  geom_point(size = 3, color = "#2C7FB8") +
  labs(
    x = "Position depth (coverage)",
    y = "Proportion of genotypes with missed alleles"
  ) +
  scale_x_continuous(breaks = seq(0, 20, by = 2)) +
  expand_limits(y = 0) +
  theme_minimal(base_size = 13) +
  theme(
    panel.grid.minor = element_blank(),
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black"),
    axis.line = element_line(color = "black", linewidth = 0.4)
  )
ggsave("img/missingalleles.png")
