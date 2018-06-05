function [py,Y] = util_lrclass_multi(x,w,useBias)
%% function ll = util_lrclass_multi(x,w)
% logistic regression softmax classifier p(C|x,w)
% Input:
%   w: row sized [nClasses, nParams]
%   X: column    [nInstance, nFeats]
% Output:
%   p(C|X,w)     [nInstance, nClasses]

if(nargin==2 || useBias==1)
    assert(size(x,2)+1 == size(w,2));  % dims = x columns = w columns.
    
    %y = 1./(1+exp( -w(2:end) * x' + w(1)))';

    N = size(x,1);

    %y = exp(w(:,2:end)*x' + repmat(w(:,1),1,N));
    %Neater:
    %y = exp(w*[ones(N,1),x]');

    logy = w*[ones(N,1),x]';

else
    assert(size(x,2) == size(w,2));
    
    %y = exp(w*x');
    logy = w*x';
end

nc = size(logy,1);
maxy = max(logy,[],1);
y = exp(logy-ones(nc,1)*maxy);
py = normalise(y,1)';

[~,Y] = max(py,[],2);

assert(all(~isnan(py(:)))); %Under/over flow.