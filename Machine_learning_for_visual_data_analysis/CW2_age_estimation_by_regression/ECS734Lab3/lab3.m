%% information
% facial age estimation
% regression method: linear regression
% last updated: Feb 2013

%% settings
clear
clc

% path 
database_path = './data_age.mat'
result_path = './results/'

% initial states
absTestErr = 0
cs_number = 0


% cumulative error level
err_level = 5

%% Training 
load(database_path)

nTrain = length(trData.label) % number of training samples
nTest  = length(teData.label) % number of testing samples
xtrain = trData.feat % feature
ytrain = trData.label % labels

w_lr = regress(ytrain,xtrain)
   
%% Testing
xtest = teData.feat % feature
ytest = teData.label % labels

yhat_test = xtest * w_lr

%% Compute the MAE and CS value (with cumulative error level of 5) for linear regression 
MAE = (abs(yhat_test - ytest))/(size(ytest,1))
CS = abs(yhat_test - ytest)/err_level

%% generate a cumulative score (CS) vs. error level plot by varying the error level from 1 to 15. The plot should look at the one in the Week6 lecture slides

%% Compute the MAE and CS value (with cumulative error level of 5) for both partial least square regression and the regression tree model by using the Matlab built in functions.

%% Compute the MAE and CS value (with cumulative error level of 5) for Support Vector Regression by using LIBSVM toolbox
