function [ll,dll] = util_lrlik_reg_2c(Y,X,w)
%% function ll = util_lrlik_2c(y,x,w)
% Return negative log likelihood of a dataset under logistic regression classifier.
% Input:
%   w: row sized [1, nParams]
%   X: column    [nInstance, nFeats]
%   Y: column    [nInstance, 1]. 1/0 class data.
% Output:
%   ll: p(X,Y|w)
%   dll: d[p(X,Y|w)]/dw

alpha = 0.1;
pY_XW = util_lrclass_2c(X,w);
nParam = numel(w);

if(min(pY_XW(:))<1e-9)
    pY_XW(pY_XW<1e-9)=1e-9;
    %pY_XW = normalise(pY_XW,2);
    %warning('util_lrlik_reg2c: Fixing overconfident posterior');
end
if(max(pY_XW(:))>(1-1e-9))
    pY_XW(pY_XW>(1-1e-9))=1-1e-9;
    %pY_XW = normalise(pY_XW,2);
    %warning('util_lrlik_reg2c: Fixing overconfident posterior');
end

ll = -sum(Y.*log(pY_XW)+(1-Y).*log(1-pY_XW)) + alpha*(w*w');

assert(~isnan(ll));

if(nargout>1) %% Return gradient.
    dll = -sum(repmat((Y - pY_XW),1,nParam).*[ones(size(X,1),1),X],1) + 2*alpha*w;
end