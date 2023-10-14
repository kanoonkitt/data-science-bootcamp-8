# install.packages("mlbench")
# dataset library
library(mlbench)
library(caret)
library(tidyverse)

data("BostonHousing")
View(BostonHousing)

#rename data
df <- BostonHousing

# complete data? (check missing value)
mean(complete.cases(df))


# 1. train test split
split_data <- function(df) {
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size = n*0.8)
train_df <- df[id,]
test_df <- df[-id,]
return(list(train_df,test_df))
}

prep_data <- split_data(df)
train_data <- prep_data[[1]]
test_data <- prep_data[[2]]

# 2. train model
set.seed(42)
model <- train(medv ~ lstat+ rm + ptratio,
               data = train_data,
               method = "lm")

# 3. score/ predict new data (test / unseen data)
p <- predict(model, newdata = test_data)


# 4. evaluate model
#mae
cal_mae <- function(actual, pred) {
  error <- actual - pred
  return(mean(abs(error)))
}


#mse
cal_mse <- function(actual, pred) {
  error <- actual - pred
  return( mean(error ** 2))
}

#rmse
cal_rmse <- function(actual, pred) {
  error <- actual - pred
  return( sqrt(mean(error ** 2)))
}

mae <- cal_mae(test_data$medv,p)
mse <- cal_mse(test_data$medv,p)
rmse <- cal_rmse(test_data$medv,p)



## save model .RDS
saveRDS(model, "lm_model.RDS")

## read model (readRDS)
imp_model <- readRDS("lm_model.RDS")


data("BostonHousing")

##predict data using import model
p_new <- predict(imp_model, newdata=BostonHousing[1:20,])


## train control
# change resampling technique

## golden rule: K-Fold CV
set.seed(42)
ctrl <- trainControl(
  method = "cv",
  #number = K in k-fold cross validation
  number = 5,
  #print iteration number in console
  verboseIter = TRUE
)


## add preProcess
model <- train(medv ~ lstat+ rm + ptratio,
               data = train_data,
               method = "lm",
               #preProcess = c("range") normalization
               preProcess = c("center", "scale"), #standardization
               trControl = ctrl)
