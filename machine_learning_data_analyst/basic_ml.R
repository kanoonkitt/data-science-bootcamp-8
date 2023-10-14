library(caret)
library(tidyverse)

# Classification And Regression Tree => caret
# Max Kuhn

# Simple ML pipeline
# 1.split data
# 2.train model
# 3.score model aka. prediction
# 4.evaluate model

View(mtcars)

full_df <- mtcars %>%
  select(mpg, hp, wt, am)

#check NA (missing value)
full_df %>%
  complete.cases() %>%
  mean()

#drop row with NA (or using replace_na() )
clean_df <- full_df %>%
  drop_na()


#1. split data 80% train, 20% test

split_data <- function(df) {
set.seed(42)
n <- nrow(df)
train_id <- sample(1:n, size = 0.8*n)
train_df <- df[train_id, ]
test_df <- df[-train_id,]
return(list(training = train_df, testing = test_df))
}

prep_data <- split_data(clean_df)
train_df <- prep_data$training
test_df <- prep_data$testing

#2. train model
lm_model <- train(mpg ~ . , 
                  data = train_df, 
                  #ML algorithm
                  method = 'lm')

#3. score aka. predict
p <- predict(lm_model,
             newdata = test_df)

#4. evaluate model

#mean absolute error
mae <- mean(abs(p - test_df$mpg))

#rmse

rmse <- sqrt(mean((test_df$mpg - p) ** 2))


lm_model$finalModel
varImp(lm_model)


##data freshness
## fast changing dataset / behaviour
## 3 months aggregated data => next month behaviour
