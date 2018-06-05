function P = util_makeGramMatPoly(X, order)
%% function P = util_makeGramMatPoly(X, order)
% Make the gram matrix (P) for the data (X) assuming polynomial of specified order (order)

B = ones(size(X,1),1);
P = B;

for o = 1 : order
    P = [P, X.^o];
end
