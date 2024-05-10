# Predictive-algorithm-for-Zomato-restaurant-data-
## OVERVIEW
This project uses R programing and restaurant data from Zomato to predict what factors do customers consider while selecting a specific restaurant. The dataset is found from the website Kaggle. This dataset contains alot od data and we don’t need to use all of it. 

## Dataset

Download the Zomato dataset from Kaggle:  https://www.kaggle.com/shrutimehta/zomato-restaurants-data .
After cleaning the data, we get one dataset contains 7 variables. The dataset contains country code, longitude, latitude, average cost for two, price range, aggregate rating, and votes. 

## Models Used
In our project, we will use two methods to build our models. 
The first is linear regression. We first build relationship of average cost and other variables. Then we get some information.
Then we use stepAIC() function to implement backward selection and find the final result. 
Then we use utilize Lasso to fit a model with the related variables to predict our outcome variable, average cost. First we transform data into a matrix and vector, then we use the training matrix, training vector, and the cv.glmnet () function to fit a Lasso model in order to find the best (minimum) Lambda.
The second model we use is PCR.  We want to find how many principal components should be chosen. We want to find if the PCR model is more accurate than linear regression model.

## Results
We find that R-square for Linear regression model is lower than that from fitting a Lasso model (98%>94%). We also find that linear regression and Lasso both give us reduced model consist of three components, and PCR model gives us a model of 3 components too. But we find that PCR model has a higher MSE than linear regression model, so we think linear regression is more accurate than PCR model.

## Conclusion
After building linear regression model,PCR model and using Lasso methods, we find that linear regression is the best model for us. And longitude, price range and votes are three components that customers focus on the most while selecting restaurants.
This can help restaurants to know how to improve their quality to attract more people and help customers to choose good restaurants. 
