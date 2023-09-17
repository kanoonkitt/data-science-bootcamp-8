print("hello world")
print("batman is a good movie")

library(dplyr)

mtcars %>%
   select(1:5) %>%
   filter(mpg > 30)
