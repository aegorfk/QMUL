%% Cell 1. Load Data.
load('lab3_1.mat');
figure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);

%% Cell 2. Show a classification hypothesis.
w = [0, -5, 0]; %Weights for MaxEnt classifier correspond to a particular line.
VIZ = 2;        %Option 2: Show post prob. %Option 1: Show contour.
lx = -1:0.05:1;
[LX1,LX2]=meshgrid(lx,lx);
LX=[LX1(:),LX2(:)];
util_lrViz(lx,LX,w,Xtr,Ytr,VIZ); 
pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));

%% Cell 3. Find a good classifier.
VIZ = 2; %Option 2: Show post prob.
VIZ = 1; %Option 1: Show contour.
VIZ_INT = 5;

%Iterate over weight 0,1,2
lw0 = -1:0.05:1; 
lw1 = -1;
lw2 = 1;

obj = zeros(numel(lw0),numel(lw1),numel(lw2,2)); %Record the scores.
objl= zeros(1,numel(obj)); %Record the scores linearly.
k = 0;
for w0 = 1:numel(lw0);
    for w1 = 1:numel(lw1);
        for w2 = 1:numel(lw2);
            k=k+1;
            
            w=[lw0(w0), lw1(w1), lw2(w2)];
            obj(w0,w1,w2) = util_lrlik_reg_2c(Ytr, Xtr, w); %Check if the current classifier [w0,w1,w2] works.
            
            objl(k) = obj(w0,w1,w2);
            if(mod(k,VIZ_INT)==0) %Plot results every few iterations.
                util_lrViz(lx,LX,w,Xtr,Ytr,VIZ); pause(0.01);
                sfigure(1); clf; plot(objl(1:k)); xlabel('Iteration'); ylabel('Objective to Minimize');
                sfigure(3); bar(w); title('Current weights');
            end
            
            
        end
    end
end

i = find(obj==min(obj(:))); [i,j,k]=ind2sub(size(obj),i);
w = [lw0(i), lw1(j), lw2(k)];
fprintf(1,'Best Weights Found: %1.3f,%1.3f,%1.3f.\n',w);
util_lrViz(lx,LX,w,Xtr,Ytr,VIZ); pause(0.01);

pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTe = util_lrclass_2c(Xte,w); predTe = pTe>0.5; fprintf(1,'Test acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));

%% Cell 4a
% llh is the goodness/objective of the current classifier.
% dllh is the gradient of the objective given the weights.
w = [0,-1,1]
[llh,dllh] = util_lrlik_reg_2c(Ytr, Xtr, w)
pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));

%% Cell 4b: Move the weights in the direction of their gradient to improve the classifier.
step = 0.1;
% >>> Add a line here to move weight in the direction dllh. <<<
[llh,dllh] = util_lrlik_reg_2c(Ytr, Xtr, w)
pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));

%% Cell 5: Let matlab follow the gradient to the best classifier.
w0 = [0,-1,1];
options = optimset('GradObj','on');
f    = @(w) util_lrlik_reg_2c(Ytr, Xtr, w);
[w,fval,eflag,out] = fminunc(f, w0, options);
util_lrViz(lx,LX,w,Xtr,Ytr,VIZ);

pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTe = util_lrclass_2c(Xte,w); predTe = pTe>0.5; fprintf(1,'Test acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));

