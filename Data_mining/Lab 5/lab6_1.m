%% Cell 1: Load some data.
load fisheriris; %Load classic flower dataset.
X = meas(:,1:2);
[sval,~,y]=unique(species);

%X(:,1)=X(:,1);

figure(1); clf; gscatter(X(:,1),X(:,2),y); 

%% Cell 2: Setup K-means.
rng(0);
K = 2;
centres = randn(K,2)+ones(K,1)*mean(X,1);
utilPlotKmeans(X,centres,[],false);

%% Cell 3: Classify points.
[lab,totalDistToCluster] = assignPointsToClusters(X,centres);
figure(1); clf; utilPlotKmeans(X,centres,lab,true); title('Updating cluster assignments');

%% Cell 4: Update clusters.
for c = 1 : K
    centres(c,:) = mean(X(lab==c,:),1);
end
figure(2); clf; utilPlotKmeans(X,centres,lab,true);
totalDistToClusterUpdated = getDistToCluster(X,lab,centres); title('Updating cluster centres');

