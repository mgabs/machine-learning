function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% h = {multiply X and theta, in the proper order that the ....inner dimensions match}
h = X * theta;
% compute error
error = h - y;
%  error squared
error_sqr = error .^ 2;
% fprintf('m is :%f\n', m)
J = (sum(error_sqr)) * (1/(2*m));

 % =========================================================================

end
