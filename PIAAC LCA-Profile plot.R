##### LCA: 4 Groups #####
lca1 <- read.csv("PIAAC LCA-v3-pp4.csv", fileEncoding = 'UTF-8-BOM')

install.packages("reshape2")
install.packages("dplyr")
install.packages("ggplot2")
library(reshape2)
library(dplyr)
library(ggplot2)

lcaR1 <- melt(lca1, id.vars = "group")
lcaR1 <- group_by(lcaR1, group)

# Profile plot w/ linetype & shape
ggplot(lcaR1, aes(variable, value, color = group)) +
  geom_line(aes(group = group, color = group, linetype = group)) +
  geom_point(aes(color = group, shape = group), size = 2) +
  labs(color = "Class", linetype = "Class", shape = "Class",
       x = "Indicator", y = "Probability") +
  theme(text = element_text(size = 12)) + #font size = 12
  theme(legend.position = "bottom", legend.direction = "vertical", legend.title = element_blank()) + #legend positioning
  ylim(0.00, 1.00)
ggsave(file = "Profile plot-4 class.png", width = 16, height = 8)
ggsave(file = "Profile plot-4 class.png", width = 12, height = 6)

# Profile plot w/ linetype & shape by groups
ggplot(lcaR1, aes(variable, value, color = group, group = group)) +
  geom_line(aes(linetype = group)) +
  geom_point(aes(shape = group), size = 2) +
  facet_wrap(~group, nrow = 2) +
  labs(color = "Class", linetype = "Class", shape = "Class", 
       x = "Indicator", y = "Probability") +
  theme(text = element_text(size = 12)) + #font size = 12
  theme(legend.position = "none") + #legend positioning
  ylim(0.00, 1.00)
ggsave(file = "Profile plot-4 class sep.png", width = 16, height = 8)
ggsave(file = "Profile plot-4 class sep.png", width = 12, height = 6)
