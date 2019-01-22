#install.packages('MASS')
install.packages('neuralnet')
library(MASS)
library(caTools)

data <- Boston

## Clean & Normalize data
any(is.na(Boston))
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)
scaled.data <- scale(data, center = mins, scale = maxs - mins)
scaled <- as.data.frame(scaled.data)

#Partition
split <- sample.split(scaled$medv, SplitRatio = 0.7)
train <- subset(scaled, split == T)
test <- subset(scaled, split == F)

