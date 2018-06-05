%% Cell 1: Load some data.
load fisheriris; %Load classic flower dataset.
X = meas(:,1:2);
[sval,~,y]=unique(species);

figure(1); clf; gscatter(X(:,1),X(:,2),y); 

%% Cell 2: Setup K-means.
rng(1);
K = 5;
centres = randn(K,2)+ones(K,1)*mean(X,1);
utilPlotKmeans(X,centres,[],false);

%% Cell 3.
totalDistToCluster = [];
for iter = 1 : 2 : 30
    
    [lab,totalDistToCluster(iter)] = assignPointsToClusters(X,centres,'euclidean');

    figure(1); clf; utilPlotKmeans(X,centres,lab,true); title('Updating cluster assignments');

    for c = 1 : K
        centres(c,:) = mean(X(lab==c,:),1);
    end
    
    figure(2); clf; utilPlotKmeans(X,centres,lab,true);
    totalDistToCluster(iter+1) = getDistToCluster(X,lab,centres); title('Updating cluster centres');

    drawnow; pause(0.05);
end

figure(3); clf; plot(totalDistToCluster); ylabel('Sum Dist of All Points to Clusters'); xlabel('Kmeans Iteration');
fprintf(1,'Kmeans Finished: Final cluster quality: %1.1f.\n', totalDistToCluster(end));

