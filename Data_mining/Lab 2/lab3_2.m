%% Cell 1
load('lab3_2.mat','Xtr','Xte','Ytr','Yte');
figure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);
rng(0);

%% Cell 2: MaxEnt
lx=-4:0.05:4;
[LX1,LX2]=meshgrid(lx,lx);
LX=[LX1(:),LX2(:)];
w0 = randn(1,size(Xtr,2)+1);
options = optimset('GradObj','on');
f    = @(w) util_lrlik_reg_2c(Ytr, Xtr, w);
[w,fval,eflag,out] = fminunc(f, w0, options);
util_lrViz(lx,LX,w,Xtr,Ytr,2);

pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTe = util_lrclass_2c(Xte,w); predTe = pTr>0.5; fprintf(1,'Test acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));

%% Cell 3: KNN.
figure(1); clf;
K=4;

predAll = knnclassify(LX,Xtr,Ytr,K,'euclidean');
imagesc(lx,lx,reshape(predAll,numel(lx),numel(lx))); colorbar; axis xy; hold on; colormap jet; caxis([0,1]); hold on;
plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'mx','linewidth',2.0);
plot(Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2.0);


predTr = knnclassify(Xtr,Xtr,Ytr,K);
fprintf(1,'K=%d. Train acc: %1.2f\n', K, sum(Ytr==predTr)/numel(Ytr));
predTe = knnclassify(Xte,Xtr,Ytr,K);
fprintf(1,'K=%d. Test acc: %1.2f\n', K, sum(Yte==predTe)/numel(Yte));
xlabel(sprintf('K=%d. Test acc: %1.2f\n', K, sum(Yte==predTe)/numel(Yte)));


%% Cell 4: Back to easy data. But what about feature relevance?
load('lab3_1.mat');
rng(0);
sfigure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);

Xtr = [Xtr, randn(length(Xtr),8)];
Xte = [Xte, randn(length(Xtr),8)];

sfigure(3); clf; plot3(Xtr(Ytr==1,1),Xtr(Ytr==1,2),Xtr(Ytr==1,3),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),Xtr(Ytr==0,3),'bo','linewidth',2);

