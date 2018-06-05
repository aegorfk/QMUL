%% Cell 1: Load some data.
load fisheriris; %Load classic flower dataset.
X = meas(:,1:2); d = 2;
X = meas; d = 4;
[sval,~,y]=unique(species);

figure(4); clf; gscatter(X(:,1),X(:,2),y);  title('True Classe Labels');

%% Cell 2: Setup K-means.
figure(1); clf;
rng(1);
K = 3;
centres = randn(K,d)+ones(K,1)*mean(X,1);
utilPlotKmeans(X,centres,[],false);


%% Cell 3: Run K-means.
for iter = 1 : 10
    
    [lab,totalDistToCluster(iter)] = assignPointsToClusters(X,centres);

    figure(1); clf; utilPlotKmeans(X,centres,lab,true); title('Updating cluster assignments');

    for c = 1 : K
        centres(c,:) = mean(X(lab==c,:),1);
    end
    
    figure(2); clf; utilPlotKmeans(X,centres,lab,true); title('Updating cluster centres');
    
    drawnow; pause(0.05);
end

figure(3); clf; plot(totalDistToCluster); ylabel('Sum Dist of All Points to Clusters'); xlabel('Kmeans Iteration');
fprintf(1,'Kmeans Finished: Final cluster quality: %1.1f\n', totalDistToCluster(end));

%% Cell 4: Print final results.
[acc,maps,labMap]=utilClusterAccuracy(lab,y);
fprintf(1,'Best cluster accuracy found: %1.1f\n', max(acc)/numel(y));