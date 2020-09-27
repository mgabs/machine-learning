function J = costFunction(X, y, theta)
%  Description
%   = ()
%
% Long description
% X is the "design matrix"
% X is the "labels"
% theta "regr coeffs"

m = size(X,1);
perdications = X*theta;

sqrErrors = (perdications-y).^2;
J= 1 /(2*m) * sum(sqrErrors);

% `if [[ $TM_CLOSE_FUNCTIONS -ne '0' ]]
%   then
%   if [[ $TM_USE_OCTAVE -ne '0' ]]
%     then echo "endfunction"
%   else
%     echo "end ${TM_COMMENT_START}function"
%   fi
% fi`
