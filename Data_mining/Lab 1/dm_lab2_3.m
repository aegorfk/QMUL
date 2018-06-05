disp('Data Mining - Lab 2Q3: Choosing Regularizer with Cross-Validation');
clear all; close all;

load('dm_lab2_3.mat');
figure(1); clf;
plot(xTrue,yTrue,'k:',xTrain,yTrain,'b.',xTest,yTest,'r*'); title('True Dist (3rd order poly) and Samples');

%% Cross validation 
rng('default');
o = 5; nTrain = numel(xTrain);
bestlam = -1;
minerr = Inf;
for lam = [0,logspace(-3,1,5)]
    %Split the train samples into training and validation dataset
    ids = randperm(nTrain);
    num_train = ceil(nTrain*0.75);
    xtrainset = xTrain(ids(1:num_train));
    ytrainset = yTrain(ids(1:num_train));
    xvalset   = xTrain(ids(num_train+1:end));
    yvalset   = yTrain(ids(num_train+1:end));
    phitrain  = util_makeGramMatPoly(xtrainset, o);
    phival    = util_makeGramMatPoly(xvalset,o);
    phitest   = util_makeGramMatPoly(xTest,o);
    I         = eye(o+1);
    
    %This line learns the regression model for a given lambda.
    w_map     = inv(lam*I + phitrain' * phitrain)*phitrain'*ytrainset; 
    
    %The next line will help decide which is the best lambda.   
    % --- FIX ME: COMMENT OUT TWO OF THE LINES BELOW, SO EXACTLY ONE IS ENABLED ---  
    % SSE = sum((ytrainset - phitrain*w_map).^2);
    SSE = sum((yvalset - phival*w_map).^2);  
    %SSE = sum((yTest - phitest*w_map).^2);
    % --- FIX ME: COMMENT OUT TWO OF THE LINES BELOW, SO EXACTLY ONE IS ENABLED ---
    
    fprintf(1,'Lambda: %1.5f, CV SSE: %1.5f.', lam, SSE);
    if(SSE < minerr)
       fprintf(' * New best\n');
       bestlam = lam;
       minerr = SSE;
    else
       fprintf('\n');
    end 
end 

%% Show the results
phi        = util_makeGramMatPoly(xTrain, o);
phiAll     = util_makeGramMatPoly(xTrue', o);
best_w_map = inv(bestlam*I + phi' * phi)*phi'*yTrain;
phitest    = util_makeGramMatPoly(xTest,o); 
trainsigEst = sum((yTrain - phi*best_w_map).^2);
testsigEst  = sum((yTest - phitest*best_w_map).^2);

figure(1); clf; title('Data and Trained model');
plot(xTrue,yTrue,'k:',xTrain,yTrain,'b.',xTest,yTest,'r*',xTrue, phiAll*best_w_map,'-');
legend('True Distribution','Train Data','Test Data','Predicted Model');
fprintf(1,'Chosen Lambda: %1.3f, Final Train Error: %1.3f, Final Test Error: %1.3f\n', bestlam, trainsigEst, testsigEst);





