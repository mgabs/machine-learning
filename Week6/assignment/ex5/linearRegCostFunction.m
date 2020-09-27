function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the
%   cost of using theta as the parameter for linear regression to fit the
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% h = {multiply X and theta, in the proper order that the ....inner dimensions match}
% h = X * theta;
% compute error
% error_val = h - y;
error_val = (X * theta) - y;

% escaping regularizing theta(1)
theta(1)=0;
p = lambda * sum(theta.^2);

% Linear Reg cost function
J = (sum( error_val.^2 ) + p ) / (2 * m);


% calculating gradient
change = X'*error_val / m;
grad = change + (theta *(lambda/m));










% =========================================================================

grad = grad(:);

end
