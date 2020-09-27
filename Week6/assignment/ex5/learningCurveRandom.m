function [error_train, error_val] = ...
    learningCurveRandom(X, y, Xval, yval, lambda, loops)
%LEARNINGCURVE Generates the train and cross validation set errors needed
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular,
%       it returns two vectors of the same length - error_train and
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

m = size(X,1)     % the number of training examples
r = size(Xval,1)  % the number of validation examples

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in
%               error_train and the cross validation errors in error_val.
%               i.e., error_train(i) and
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the cross-validation error, you should instead evaluate on
%       the _entire_ cross validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and cross validation error, you should
%       call the function with the lambda argument set to 0.
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
% Hint: You can loop over the examples with the following:
%
%       for i = 1:m
%           % Compute train/cross validation errors using training examples
%           % X(1:i, :) and y(1:i), storing the result in
%           % error_train(i) and error_val(i)
%           ....
%
%       end
%

% ---------------------- Sample Solution ----------------------

% theta = trainLinearReg(X, y, lambda);

for i = 1:m
  % Compute train/cross validation errors using training examples
  % X(1:i, :) and y(1:i), storing the result in
  % error_train(i) and error_val(i)

  % create two empty vectors for the Jtrain and Jcv values
  J_train = zeros(m,1);
  J_cv = zeros(r, 1);

  for j = 1:loops
    % use 'm' to select 'i' random examples from the training set
    sel = randperm(m);
    sel = sel(1:i);
    X_tsel = X(sel,:);
    y_tsel = y(sel, :);

    % use 'r' to select 'i' random examples from the validation set
    sel = randperm(r);
    sel = sel(1:i);
    X_csel = Xval(sel, :);
    y_csel = yval(sel, :);

    % X_train = X(1:i,:);
    % y_train = y(1:i,:);

    theta = trainLinearReg(X_tsel, y_tsel, lambda);
    % theta = trainLinearReg(X, y, lambda);

    % Training error - Linear Reg cost function
    J_train(i) = J_train(i) + linearRegCostFunction(X_tsel, y_tsel, theta, 0 );
    % J_train(i) = linearRegCostFunction(X_tsel, y_tsel, theta, 0 );

    % CV error - Linear Reg cost function
    J_cv(i) =  J_cv(i) + linearRegCostFunction(X_csel, y_csel, theta, 0);
    % J_cv(i) = linearRegCostFunction(X_csel, y_csel, theta, 0);
  end

  error_train(i) = error_train(i) + J_train(i);
  error_val(i) = error_val(i) + J_cv(i);

end

% finding the average
error_train = error_train ./ loops;
error_val = error_val ./ loops;
% error_train = mean(error_train);
% error_val = mean(error_val);
% -------------------------------------------------------------

% =========================================================================

end
