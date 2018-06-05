disp('Data Mining - Lab 2Q2: Polynomial Regression with Regularization');
clear all; close all;
rng('default');
%% Create and show some 3rd order polynomial data.
[xTrain,yTrain,xTest,yTest,xVal,yVal,xTrue,yTrue] = utilCreatePolyData(10); %Parameter here specifies how many points to generate.
figure(1); clf;
plot(xTrue,yTrue,'k:',xTrain,yTrain,'b.',xTest,yTest,'r*'); title('True Dist (3rd order poly) and Samples');


%% Perform Regression with Different order polynomials, to observe the overfitting problem 
%Basis Function phi(x)=Poly
LAMBDA = 0; %THIS IS THE REGULARIZATION STRENGTH.
figure(2); clf;
subfigid = 0;
testerr= zeros(3,1);
trainerr = zeros(3,1);
for o = [1,3,9];
    subfigid = subfigid+1;
    set(gcf,'name',['REGULARIZATION LAMBDA = ', num2str(LAMBDA)]);
    phiTrain = util_makeGramMatPoly(xTrain, o);
    phiTest  = util_makeGramMatPoly(xTest,o);  
    phiAll   = util_makeGramMatPoly(xTrue' ,o);
    I        = eye(o+1);
    
    %%%%%%%%%%%%%% This is the key model fitting line %%%%%%%%%%%%%%%%%%
    % This should match the equation for best fit of a polynomial in the course notes.
    w_ml     = pinv(LAMBDA*I + phiTrain' * phiTrain)*phiTrain'*yTrain;
    %%%%%%%%%%%%%%% Compute w using phi and yTrain %%%%%%%%%%%%%%%%%%%%%
    
    subplot(1, 3, subfigid); plot(xTrain,yTrain,'b.', xTest,yTest,'r*', xTrue, phiAll*w_ml,'b-', xTrue, yTrue,'k:'); set(gca,'ylim',[-0.5,2]);
    title(['Poly Regression order=',num2str(o)]); ylabel('ML');
    trainSSE = sum((yTrain - phiTrain*w_ml).^2);
    testSSE  = sum((yTest - phiTest*w_ml).^2);
    fprintf(1,'Lambda = %1.3f, Order=%d. Train Error: %1.2f / Test Error: %1.2f\n', LAMBDA, o,  trainSSE,testSSE);
    xlabel(sprintf('Train Error: %1.2f\n Test Error: %1.2f\n',trainSSE,testSSE));        
end 
