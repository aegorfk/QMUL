function [ll,dll,H] = util_lrlik_multi2(Y,X,W,l,useBias)
%% function ll = util_lrlik_multi(y,x,w)
% Negative LLH of dataset under logistic regression softmax classifier.
% Input:
%   W: row sized [nClasses, nParams]
%   X: column    [nInstance, nFeats]
%   Y: column    [nInstance, nClasses]. Boolean array with one true per row.
%   l: scalar positive regularizer (default: 0.1).
% Output:
%   p(X,Y|w)
%
% V2: Includes tunable regularizer.

% if(size(x,1)<size(x,2)) %Rotate to data on rows
%     x = x';
% end
% if(size(y,1)<size(y,2))
%     y = y';
% end

%Convert linear to binary label matrix.
if(isvector(Y))
    Y0 = false(length(Y),max(Y));
    ind = sub2ind(size(Y0), (1:length(Y))', Y);
    Y0(ind) = true;
    Y = Y0;
end
%Make sure data feats & weight params # match.
if(nargin<5 || useBias)
    assert(size(X,2)==size(W,2)-1);
    useBias = true;
else
    assert(size(X,2)==size(W,2));
end

if(size(X,1)~=size(Y,1))
    error('util_lrlik_multi: x and y must both have data on rows');
end

if(nargin < 4)
    l = 0.1;
end

nDims = size(X,2);
pY_XW = util_lrclass_multi(X,W,useBias)';
ll = -sum(log(pY_XW(Y'))) + l*sum(sum(W.*W)); 

%Optimize these out for now?
%assert(~isnan(ll));

if(nargout>1) %% Return gradient.
    N = size(X,1); NC = size(W,1);
        
%     %V1: Slower.
%     dll = zeros(size(W));
%     if(useBias)
%         for c = 1 : NC
%             dll(c,:) = -sum(repmat((Y(:,c) - pY_XW(c,:)'),1,nDims+1).*[ones(N,1),X],1);
%         end
%     else
%         for c = 1 : NC
%             dll(c,:) = -sum(repmat((Y(:,c) - pY_XW(c,:)'),1,nDims).*X,1);
%         end
%     end
    
    %V2: Faster
    if(useBias), X = [ones(N,1), X]; end
    dll2 = (pY_XW-Y')*X;
    
    dll = dll2 + 2*l*W;
end

if(nargout>2) %Return hessian.
%     %V1: Slowest
%     H = zeros(numel(W),numel(W));
%     M = size(W,2); I = eye(NC,NC);
%     for d = 1 : N
%         for ck = 1 : NC
%             for cj = 1 : NC
%                 %block = - pY_XW(ck,d) * (I(ck,cj) -pY_XW(cj,d)) * [1,X(d,:)]'*[1,X(d,:)];
%                 block = - pY_XW(ck,d) * (I(ck,cj) -pY_XW(cj,d)) * X(d,:)'*X(d,:);
%                 H( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) = H( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) + block;
%             end
%         end
%     end
%     
%     %V2: Slower
%     X2 = reshape(X', [M, 1, N]); X3 = reshape(X2, [1, M, N]);
%     outer = bsxfun(@times,X2,X3); 
%     H2 = zeros(numel(W),numel(W));
%     M = size(W,2); I = eye(NC,NC);
%     for d = 1 : N
%         for ck = 1 : NC
%             for cj = 1 : NC
%                 block = - pY_XW(ck,d) * (I(ck,cj) -pY_XW(cj,d)) * outer(:,:,d); %[1,X(d,:)]'*[1,X(d,:)];
%                 H2( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) = H2( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) + block;
%             end
%         end
%     end
%     
%     %V3: Faster
%     M = size(W,2); I = eye(NC,NC);
%     X2 = reshape(X', [M, 1, N]); X3 = reshape(X2, [1, M, N]); %Assume been appended or not according to if it's biased or not.
%     outer = bsxfun(@times,X2,X3); 
%     H3 = zeros(numel(W),numel(W));
%      
%     for ck = 1 : NC
%         for cj = 1 : NC
%             %block = - bsxfun(@times, reshape(pY_XW(ck,:) .* (I(ck,cj) -pY_XW(cj,:)),[1,1,N]), outer); %[1,X(d,:)]'*[1,X(d,:)];
%             %H3( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) = sum(block,3);
%             H3( (ck-1)*M+1:ck*M , (cj-1)*M+1:cj*M ) = -sum(bsxfun(@times, reshape(pY_XW(ck,:) .* (I(ck,cj) -pY_XW(cj,:)),[1,1,N]), outer),3);
%         end
%     end
    
    %V4: Fastest. But memory!
    M = size(W,2); I = eye(NC,NC);
    X2 = reshape(X', [M, 1, N]); X3 = reshape(X2, [1, M, N]); %Assume been appended or not according to if it's biased or not.
    outer = bsxfun(@times,X2,X3); 
    t1 = bsxfun(@times, reshape(pY_XW,[NC,1,N]), ...
                        bsxfun(@minus, I, reshape(pY_XW,[1,NC,N])));
    %t2 = imresize(t1, [NC*M, NC*M], 'nearest');
    t2 = tmhScaleMatrix(t1, M);
    t3 = repmat(outer, [NC, NC]);
    H4 = -sum(t2.*t3,3); %O( NC^2 * M^2 * NData)
            
    
    %V5
    H5 = zeros(numel(W),numel(W));
    M = size(W,2); I = eye(NC,NC);
    X2 = reshape(X', [M, 1, N]); X3 = reshape(X2, [1, M, N]); %Assume been appended or not according to if it's biased or not.
    outer = bsxfun(@times,X2,X3); 
    t1 = bsxfun(@times, reshape(pY_XW,[NC,1,N]), ...
                        bsxfun(@minus, I, reshape(pY_XW,[1,NC,N])));
    for d = 1 : N
        H5 = H5 - tmhScaleMatrix(t1(:,:,d), M) .* repmat(outer(:,:,d),[NC,NC]);
    end
    
    H = H5 + 2*l*eye(numel(W));
end