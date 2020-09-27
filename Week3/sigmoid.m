x = [1:100]

function [y] = sigmoid(x),
  %   SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.


% Compute the sigmoid of each value of z (z can be a matrix,
% vector or scalar).

  y = 1 ./ ( 1 + exp(-x));
end

sigmoid(x)
