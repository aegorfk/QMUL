function [xTrain,yTrain,xTest,yTest,xVal,yVal,xTrue,yTrue] = utilCreatePolyData(nTrain)
if(nargin==0)
    nTrain=10;
end
rng(1);
xTrue  = -1:0.01:1;
nTrue  = numel(xTrue);
yTrue  = 1+xTrue.^3;
sig    = 0.1;
idx    = ceil(rand(nTrain,1)*200); %training samples.

nTest = 20;
nVal  = 20;
xTrain = xTrue(idx)'; 
yTrain = yTrue(idx)' + randn(nTrain,1)*sig; 

idxLeft = setdiff(1:nTrue,idx);
idxLeft = idxLeft(randperm(numel(idxLeft)));
idx2    = idxLeft(1:nTest);
xTest = xTrue(idx2)';
yTest = yTrue(idx2)'+randn(nTest,1)*sig;

idxLeft = idxLeft(randperm(numel(idxLeft)));
idx2    = idxLeft(1:nVal);
xVal = xTrue(idx2)';
yVal = yTrue(idx2)'+randn(nVal,1)*sig;

figure(1); clf;
plot(xTrue,yTrue,'k:',xTrain,yTrain,'b.',xVal,yVal,'mo',xTest,yTest,'r*'); title('True Dist (3rd order poly) and Samples'); legend('True Function','Train Data','Val Data','Test Data','location','southeast');
%save('dm_lab2_1.mat','xTrainBig','yTrainBig','xTrain','xTest','yTrain','yTest','xTrue','yTrue');