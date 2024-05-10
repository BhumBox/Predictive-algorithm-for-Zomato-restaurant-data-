#first, exrat the data set the country is usa.
zomato.11 <- read.csv("C:/Users/libo/Desktop/zomato 11.csv")
View(zomato.11)
usa <- subset(zomato.11, Country.Code==216)
View(usa)
row.number1<-sample(x=1:nrow(usa),size=0.75*nrow(usa))
train=usa[row.number1,]
test=usa[-row.number1,]
library(MASS)
lm1<-lm(Average.Cost.for.two~. , data=train)
summary(lm1)
step<-stepAIC(lm1,direction = "backward")
step$anova


#part 2 , we use the classification and clustering to find some result in this dataset, the first one we want to use lasso to utilize the model of  our output
View(usa)
form1<-usa
set.seed(12345)
row.number1<-sample(x=1:nrow(usa),size=0.75*nrow(usa)
train=usa[row.number1,]
test=usa[-row.number1,]
dim(train)
head(train)
head(test)

install.packages("glmnet")
library(glmnet)
set.seed(1)
row.number <- sample(x=1:nrow(usa), size=0.75*nrow(usa))
train=usa[row.number1,]
test=usa[-row.number1,]
x <- model.matrix(Average.Cost.for.two~., train)[,-1]#this transforms x from a variable within a dataframe into a matrix
y <- train$Average.Cost.for.two#this transforms y from a variable within a dataframe into a vector
x_test <- model.matrix(Average.Cost.for.two~., test)[,-1]
y_test <- test$Average.Cost.for.two
#step 2
x <- model.matrix(Average.Cost.for.two~., train)[,-1]
y <- train$Average.Cost.for.two
ridge<-glmnet(x,y,alpha = 0,nlambda = 100,lambda.min.ratio = 0.0001)
set.seed(1)
cv.lasso <- cv.glmnet(x, y, alpha=0, nlambda=100, lambda.min.ratio=0.0001)
bestone<-cv.lasso$lambda.min
bestone
xtest<-model.matrix(Average.Cost.for.two~., test)[,-1]
y <- test$Average.Cost.for.two
y_predicted<-predict(ridge,s=bestone,newx = xtest)
y_predicted
sst3<-sum(y_test^2)
sse3<-sum((y_predicted-y_test)^2)
r2<-1-sse3/sst3
r2

#part3
library(pls)
require(pls)
require(pls)
set.seed (1000)
usa1<- c("Longitude","Latitude","Average.Cost.for.two","Price.range","Aggregate.rating","Votes")
usa2<- usa2[, usa1]
usa3<- na.omit(usa2)
row.number1 <- sample(x=1:nrow(usa3), size=0.75*nrow(usa3))
train=usa3[row.number1,]
test=usa3[-row.number1,]
pcr_model <- pcr(Average.Cost.for.two~., data = train,scale =TRUE, validation = "CV")
validationplot(pcr_model, val.type = c("RMSEP"))
validationplot(pcr_model, val.type = c("MSEP"))
validationplot(pcr_model, val.type = c("R2"))

#at last 

set.seed(1)
row.number <- sample(x=1:nrow(usa3), size=0.8*nrow(usa3))
train = usa3[row.number,]
test = usa3[-row.number,]


pcr_model <- pcr(Average.Cost.for.two~., data = train,scale =TRUE, validation = "CV")
pcr_pred <- predict(pcr_model, test, ncomp = 3)
mean((pcr_pred - test$Average.Cost.for.two)^2)

ols <- lm(Average.Cost.for.two~., data = train)
ols_pred <- predict(ols, test)
mean((ols_pred - test$Average.Cost.for.two)^2)





