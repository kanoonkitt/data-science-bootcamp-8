# load ggplot library

library(ggplot2)

ggplot(diamonds, aes(caret,price)) +
  geom_point()