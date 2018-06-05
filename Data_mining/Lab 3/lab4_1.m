%% Cell 1
load fisheriris;
[~,~,Y] = unique(species);
meas = zscore(meas);
Xtr = meas(1:2:end,:); Ytr = Y(1:2:end); 
Xte = meas(2:2:end,:); Yte = Y(2:2:end); d1 = 1; d2 = 2;
%Plot each flower, colored by their species.
sfigure(1); clf; plot(Xtr(Ytr==1,d1),Xtr(Ytr==1,d2),'rx',Xtr(Ytr==2,d1),Xtr(Ytr==2,d2),'bo',Xtr(Ytr==3,d1),Xtr(Ytr==3,d2),'gd','linewidth',2);
Xtr = Xtr(:,[d1,d2]);
Xte = Xte(:,[d1,d2]);

%% Cell 2. Try to classify with MaxEnt.
lx=-2.5:0.05:2.5;
[LX1,LX2]=meshgrid(lx,lx);                      %Generate a list of every single condition in order to plot the classification space.
LX=[LX1(:),LX2(:)];
w0 = zeros(3,size(Xtr,2)+1);                    %Initial weights to start search.
options = optimset('GradObj','on');
f    = @(W) util_lrlik_multi2(Ytr,Xtr,W,0.01);
w = fminunc(f, w0, options);                    %Use gradient to get the best weights.
util_lrVizMulti(lx,LX,w,Xtr,Ytr,2);             %Visualise the space by coloring the background.
[~,predTr] = util_lrclass_multi(Xtr,w);         %Run the classifier on the train data.
[~,predTe] = util_lrclass_multi(Xte,w);         %Run the classifier on the test data.
fprintf(1,'LR Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr)); %Compute fraction of correctly classified train instances.
fprintf(1,'LR Test acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));  %Compute fraction of correctly classified test instances.


%% Cell 3. Suppose in location A, the class balance is different.
N = numel(Ytr);
idx = (Ytr==1 | Ytr==2) | ((Ytr==3)&(mod((1:N)',5)==0));    % Reduce frequency of third flower type x5.
YtrA = Ytr(idx);
XtrA = Xtr(idx,:);
YteA = Yte(idx);
XteA = Xte(idx,:);
W = zeros(3,size(Xtr,2)+1);                              %Initial weights to start search.
f = @(W) util_lrlik_multi2(YtrA,XtrA,W,0.01);            % Train the classifier for this country.
w = fminunc(f, w0, options);
util_lrVizMulti(lx,LX,w,XtrA,YtrA,2);
[~,predTrA] = util_lrclass_multi(XtrA,w);
[~,predTeA] = util_lrclass_multi(XteA,w);
fprintf(1,'Train acc: %1.2f\n', sum(YtrA==predTrA)/numel(YtrA));
fprintf(1,'Test acc: %1.2f\n', sum(YteA==predTeA)/numel(YteA));


%% Cell 4. Now suppose apply LR model to location B with different class balance.
N = numel(Ytr);
idx = (Ytr==1 | Ytr==3) | ((Ytr==2)&(mod((1:N)',4)==0));
YtrB = Ytr(idx);
XtrB = Xtr(idx,:);
YteB = Yte(idx);
XteB = Xte(idx,:);
util_lrVizMulti(lx,LX,w,XtrB,YtrB,2);

[~,predTrB] = util_lrclass_multi(XtrB,w); fprintf(1,'Train acc: %1.2f\n', sum(YtrB==predTrB)/numel(YtrB));
[~,predTeB] = util_lrclass_multi(XteB,w);  fprintf(1,'Test acc: %1.2f\n', sum(YteB==predTeB)/numel(YteB));


%% Cell 5. Train Naive Byes Classifier in country A. 
nb = NaiveBayes.fit(XtrA, YtrA);
pTr = nb.posterior(XtrA); [~,predTrA] = max(pTr,[],2); fprintf(1,'Train acc: %1.2f\n', sum(YtrA==predTrA)/numel(YtrA));
pTe = nb.posterior(XteA); [~,predTeA] = max(pTe,[],2); fprintf(1,'Test  acc: %1.2f\n', sum(YteA==predTeA)/numel(YteA));
util_nbVizMulti(lx,LX,nb,XtrA,YtrA,2);
M = confusionmat(YteA, predTeA)

%% Cell 6. Tell Naive bayes to use a uniform prior.
%S.prob = [INSERTME]; S.group = [1, 2, 3];
%nb = NaiveBayes.fit(XtrA, YtrA, 'Prior', S); 
pTr = nb.posterior(XtrA); [~,predTrA] = max(pTr,[],2); fprintf(1,'Train acc: %1.2f\n', sum(YtrA==predTrA)/numel(YtrA));
pTe = nb.posterior(XteA); [~,predTeA] = max(pTe,[],2); fprintf(1,'Test  acc: %1.2f\n', sum(YteA==predTeA)/numel(YteA));
util_nbVizMulti(lx,LX,nb,XtrA,YtrA,2);
M = confusionmat(YteA, predTeA)

%% Cell 7. Apply NB from country A to country B.
%S.prob = [INSERTME]; S.group = [1, 2, 3];
nb = NaiveBayes.fit(XtrA, YtrA, 'Prior', S); %Train for country A.
pTr = nb.posterior(XtrB); [~,predTrB] = max(pTr,[],2); fprintf(1,'Train acc: %1.2f\n', sum(YtrB==predTrB)/numel(YtrB)); %Apply to country B.
pTe = nb.posterior(XteB); [~,predTeB] = max(pTe,[],2); fprintf(1,'Test  acc: %1.2f\n', sum(YteB==predTeB)/numel(YteB)); %Apply to country B.
util_nbVizMulti(lx,LX,nb,XtrB,YtrB,2);
M = confusionmat(YteB, predTeB)
