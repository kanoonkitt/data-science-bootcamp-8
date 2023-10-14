library(ggplot2)
library(dplyr)

#distribution of diamond price
price_distribution <- ggplot(diamonds, aes(price),) +
                       geom_density(col = "red") +
                       theme_minimal() +
                       labs(caption = "Source: diamonds dataset from R studio")



#mean price of diamond for each cut style
mean_price <- diamonds %>%
 group_by(cut) %>%
 summarise(mean_price = mean(price)) %>%
 ggplot(aes(cut, mean_price, fill = cut)) +
 geom_col() +
 theme_minimal()+
 labs(caption = "Source: diamonds dataset from R studio")


#relationship between color and price
scatter_color_price <- ggplot(diamonds, aes(color, price, fill = color)) +
 geom_boxplot()+
 theme_minimal() +
 labs(caption = "Source: diamonds dataset from R studio")


#How does the depth and table measurements of diamonds vary across different cuts?
ggplot(sample_frac(diamonds, 0.5), aes(depth, table)) +
 geom_point(alpha = 0.3) +
 facet_wrap(~cut)+
 theme_minimal() +
 labs(caption = "Source: diamonds dataset from R studio",
 x = "depth",
 y = "table")



#cut and clarity
ggplot(sample_frac(diamonds, 0.2), aes(cut, clarity)) +
 geom_count(col = "red") +
 labs(caption = "Source: diamonds dataset from R studio")
