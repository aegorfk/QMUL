%% Cell 1. Comparing LR and NB with few or many dimenisons.
rng(2);
lx=-3:0.05:3;
[LX1,LX2]=meshgrid(lx,lx);
LX=[LX1(:),LX2(:)];
dim = 2;            %Generate data with only 2 dimensions.
%dim = 200;          %Generate data with 100 dimensions.

m1 = 1; m2 = 0; s1 = 1; s2 = 1; NC=25; 
Ytr = [ones(NC,1);zeros(NC,1)];
Xtr = [m1+s1*randn(NC, dim); m2+s2*randn(NC, dim)];
Yte = [ones(NC,1);zeros(NC,1)];
Xte = [m1+s1*randn(NC, dim); m2+s2*randn(NC, dim)];
sfigure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);

%% Cell 2. Train LR.
w0 = zeros(1,size(Xtr,2)+1);
options = optimset('GradObj','on');
f    = @(w) util_lrlik_reg_2c(Ytr, Xtr, w);
[w,fval,eflag,out] = fminunc(f, w0, options);
pTrLR = util_lrclass_2c(Xtr,w); predTr = pTrLR>0.5; fprintf(1,'LR Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTeLR = util_lrclass_2c(Xte,w); predTe = pTeLR>0.5; fprintf(1,'LR Test acc: %1.2f\n',  sum(Yte==predTe)/numel(Yte));

%% Cell 3. Train NB.
sfigure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);
nb = NaiveBayes.fit(Xtr, Ytr, 'Distribution', 'normal');
pTrNB = nb.posterior(Xtr); predTr = pTrNB(:,2)>0.5; fprintf(1,'NB Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTeNB = nb.posterior(Xte); predTe = pTeNB(:,2)>0.5; fprintf(1,'NB Test  acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));

%% Cell 4. Explore the effect of various thresholds.
thr = 0.1;      %Threshold to decide when to declare one class or another.
predTr = pTrLR>thr; fprintf(1,'LR Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
predTe = pTeLR>thr; fprintf(1,'LR Test acc: %1.2f\n',  sum(Yte==predTe)/numel(Yte));
cmat = confusionmat(Yte,double(predTe))

predTr = pTrNB(:,2)>thr; fprintf(1,'NB Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
predTe = pTeNB(:,2)>thr; fprintf(1,'NB Test  acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));
cmat = confusionmat(Yte,double(predTe))

%% Cell 5. Explore the ROC curve
% This code computes the confusion matrix, and TPR/FPR for NB and LR/MaxEnt.
% Add a loop over threshold to try a whole bunch of thresholds, and plot fpr against tpr to generate an roc curve.
thr = 0.25;
predTr = pTrLR>thr; fprintf(1,'LR Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
predTe = pTeLR>thr; fprintf(1,'LR Test acc: %1.2f\n',  sum(Yte==predTe)/numel(Yte));
cmat = confusionmat(Yte,double(predTe))
tpr_lr=cmat(2,2)/sum(Yte==1);
fpr_lr=cmat(1,2)/sum(Yte==0);

predTr = pTrNB(:,2)>thr; fprintf(1,'NB Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
predTe = pTeNB(:,2)>thr; fprintf(1,'NB Test  acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));
cmat = confusionmat(Yte,double(predTe))
tpr_nb=cmat(2,2)/sum(Yte==1);
fpr_nb=cmat(1,2)/sum(Yte==0);
