%% Comparing LR and NB with few or many dimenisons.
rng(2);
lx=-3:0.05:3;
[LX1,LX2]=meshgrid(lx,lx);
LX=[LX1(:),LX2(:)];
%dim = 2;            %Generate data with only 2 dimensions.
dim = 200;          %Generate data with 200 dimensions.

m1 = 1; m2 = 0; s1 = 1; s2 = 1; NC=25; 
Ytr = [ones(NC,1);zeros(NC,1)];
Xtr = [m1+s1*randn(NC, dim); m2+s2*randn(NC, dim)];
Yte = [ones(NC,1);zeros(NC,1)];
Xte = [m1+s1*randn(NC, dim); m2+s2*randn(NC, dim)];
sfigure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);

%% More LR.
w0 = zeros(1,size(Xtr,2)+1);
options = optimset('GradObj','on');
f    = @(w) util_lrlik_reg_2c(Ytr, Xtr, w);
[w,fval,eflag,out] = fminunc(f, w0, options);
pTr = util_lrclass_2c(Xtr,w); predTr = pTr>0.5; fprintf(1,'LR Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTe = util_lrclass_2c(Xte,w); predTe = pTe>0.5; fprintf(1,'LR Test acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));


%% More NB.
sfigure(2); clf; plot(Xtr(Ytr==1,1),Xtr(Ytr==1,2),'rx',Xtr(Ytr==0,1),Xtr(Ytr==0,2),'bo','linewidth',2);
nb = NaiveBayes.fit(Xtr, Ytr, 'Distribution', 'normal');
pTr = nb.posterior(Xtr); predTr = pTr(:,2)>0.5; fprintf(1,'NB Train acc: %1.2f\n', sum(Ytr==predTr)/numel(Ytr));
pTe = nb.posterior(Xte); predTe = pTe(:,2)>0.5; fprintf(1,'NB Test  acc: %1.2f\n', sum(Yte==predTe)/numel(Yte));
