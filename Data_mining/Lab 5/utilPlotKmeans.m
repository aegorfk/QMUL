function utilPlotKmeans(X,centres,lab,color)

if(nargin<3 || color)
    gscatter(X(:,1),X(:,2),lab); 
else
    scatter(X(:,1),X(:,2)); 
end
hold on;

clist = 'rgbcmyk';

for c = 1 : size(centres,1)
    h=plot(centres(c,1),centres(c,2),[clist(c),'x']);
    set(h,'LineWidth',3.0,'MarkerSize',10.0);
end
