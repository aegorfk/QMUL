## information
# facial age estimation
# regression method: linear regression
# last updated: Feb 2013

import scipy.io
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error

# path 
database_path = './data_age.mat';
result_path = './results/';

# initial states
absTestErr = 0;
cs_number = 0;

# cumulative error level
err_level = 5;

## Training 
mat_data = scipy.io.loadmat(database_path)

teData = {'label': mat_data['teData'][0][0][0], 'feat': mat_data['teData'][0][0][1]}
trData = {'label': mat_data['trData'][0][0][0], 'feat': mat_data['trData'][0][0][1]}

nTrain = len(trData['label']) # number of training samples
nTest  = len(teData['label']) # number of testing samples
xtrain = trData['feat'] # feature
ytrain = trData['label'] # labels

regressor = LinearRegression(fit_intercept=False)
regressor.fit(xtrain, ytrain)
w_lr = regressor.coef_[0]
   
## Testing
xtest = teData['feat'] # feature
ytest = teData['label'] # labels

yhat_test = np.matmul(xtest, w_lr)

## Compute the MAE and CS value (with cumulative error level of 5) for linear regression 


## generate a cumulative score (CS) vs. error level plot by varying the error level from 1 to 15. The plot should look at the one in the Week6 lecture slides



## Compute the MAE and CS value (with cumulative error level of 5) for both partial least square regression and the regression tree model by using the Matlab built in functions.



## Compute the MAE and CS value (with cumulative error level of 5) for Support Vector Regression by using LIBSVM toolbox



