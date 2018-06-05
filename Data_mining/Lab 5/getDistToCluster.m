function [totalDistToCluster] = getDistToCluster(X,lab,centres)

totalDistToCluster = sum(sqrt(sum((X-centres(lab,:)).^2,2)),1);