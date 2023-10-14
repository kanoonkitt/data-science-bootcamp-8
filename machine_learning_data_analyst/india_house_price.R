
##predict house price in india

library(caret)
library(tidyverse)

full_data <- read_csv("HousePriceIndia.csv")

##clean data
#check missing value
full_data %>%
  complete.cases() %>%
  mean()

##our price column is right-skewd
hist(full_data$Price)


#change price column to log
clean_df <- full_data %>%
  select(id,
         Lattitude,
         grade = `grade of the house`,
         living_area = `living area`,
         built_year = `Built Year`,
         living_area_renov,
         Price
         ) %>%
  mutate(logPrice = log(Price))


hist(clean_df$logPrice)

##1. Split data
# 80% / 20%
split_data <- function(df) {
  set.seed(77)
  n <- nrow(df)
  train_id <- sample(1:n, size = 0.8*n)
  train_df <- df[train_id, ]
  test_df <- df[-train_id,]
  return(list(training = train_df, testing = test_df))
}

prep_data <- split_data(clean_df)
train_df <- prep_data$training
test_df <- prep_data$testing

##2. train
lm_model <- train(logPrice ~ Lattitude+grade+living_area+built_year+living_area_renov, 
                  data = train_df , 
                  method = "lm")
#Lattitude+grade+living_area+built_year+living_area_renov
##3. Score
p_log <- predict(lm_model, newdata = test_df)
#change log value back to normal value
p <- exp(p_log) 

##4. Evaluate
#mean absolute error
mae_log <- mean(abs(p_log - test_df$logPrice))
mae <- mean(abs(p - test_df$Price))

#rmse
rmse_log <- sqrt(mean(( p_log - test_df$logPrice ) ** 2))
rmse <- sqrt(mean(( p - test_df$Price ) ** 2))

