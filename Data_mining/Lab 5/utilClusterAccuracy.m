function [acc,maps,outMap]=utilClusterAccuracy(lab,y)

maps = perms(1:max(max(y),max(lab)));
labMap = zeros(size(y));
acc = 0;
for p = 1 : size(maps,1)
    for c = 1 : size(maps,2)
        labMap(lab==c)=maps(p,c);
    end
    acc(p) = sum(labMap==y);    
    if(all(acc(p)>=acc))
        outMap = labMap;
    end
end