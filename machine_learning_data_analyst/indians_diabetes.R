library(mlbench)
library(tidyverse)
library(caret)

data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes

## split data
set.seed(42)
n <- nrow(df)
id <- sample(n, size = n*0.8)
train_df <- df[id,]
test_df <- df[-id,]

#train model
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)



# ridge/ lasso regression 
# regularized regression
#alpha 0=ridge, 1=lasso
my_grid <- expand.grid(alpha=0:1,
                       lambda = seq(0.0001,1,length=20))

glmnet_model <- train(diabetes ~ ., 
                        data = train_df, 
                        method = "glmnet",
                        tuneGrid = my_grid,
                        trControl =ctrl
                        )

#decision tree
library(rpart)
library(rpart.plot)
tree_model <- train(diabetes ~ ., 
                     data = train_df, 
                     method = "rpart",
                    #complexity parameter 
                    #high cp => good generalization
                    tuneGrid = expand.grid(cp = c(0.02, 0.1,
                                                  0.25)),
                     trControl =ctrl)
rpart.plot(tree_model$finalModel)

## random forest model
## mtry hyperparameter => n column

rf_model <- train(diabetes ~ ., 
                    data = train_df, 
                    method = "rf",
                    turnLength = 4,
                    trControl =ctrl)



#score model
p <- predict(rf_model, newdata = test_df )

#evaluate model
confusionMatrix(p,test_df$diabetes,
                positive = "pos",
                mode = "prec_recall")
accuracy <- mean(test_df$diabetes == p)
