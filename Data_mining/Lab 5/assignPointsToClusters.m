function [lab,totalDistToCluster] = assignPointsToClusters(X,centres,distMetric)
if(nargin<3)
    distMetric = 'euclidean';
end

    dmat = pdist2(X,centres,distMetric); %Find the distance between every point and every cluster.
    [sval,sidx]=sort(dmat,2,'ascend');    %For each point, sort how close all clusters are.
    lab = sidx(:,1); %Make the labe of each point be the closest cluster.
    totalDistToCluster = sum(sval(:,1)); %Overall quality of the current clustering is the distance of each point to its assigned cluster.