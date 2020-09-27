% Unit Tests for ex2.
% cd ~/Workbench/ML/Week3/assignment/ex2/

% sigmoid function
% -------------- Test template ------------
% x = 2^4; y = 16;
% if 4 == 5
%   fprintf('Sigmoid function test 1 - Passed\n')
% else
%   fprintf('Sigmoid function test 1 - Failed\n')
%   fprintf('Expected Value: %f, Actual value: %f\n', x, 5) %'%s\n'(?2:\);)(?2:\);
% end
% -------------- Test template ------------
fprintf('Unit Tests - Example 2\n')
% -------

function UT = unitTest(fx,y)
  if abs( sum(fx) - sum(y) ) <= 0.00001
    UT = true;
  else
    UT = false;
  end
end

% --------
% test case for sigmoid()
fprintf('Testing Sigmoid function\n')

x = sigmoid(-5);
y =  0.0066929;

if unitTest(x, y)
  fprintf('Sigmoid function test 1 - Passed\n')
else
  fprintf('Sigmoid function test 1 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
end


x = sigmoid(0);
y =  0.50000;
if unitTest(x, y)
  fprintf('Sigmoid function test 2 - Passed\n')
else
  fprintf('Sigmoid function test 2 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
end

x = sigmoid(5);
y =  0.99331;
if unitTest(x, y)
  fprintf('Sigmoid function test 3 - Passed\n')
else
  fprintf('Sigmoid function test 3 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
end

x = sigmoid([4 5 6]);
y =  [  0.98201   0.99331   0.99753];
if unitTest(x, y)
  fprintf('Sigmoid function test 4 - Passed\n')
else
  fprintf('Sigmoid function test 4 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  fprintf('%f', y-x)
end

x = sigmoid([-1;0;1]);
y =  [ 0.26894;    0.50000;    0.73106];
if unitTest(x, y)
  fprintf('Sigmoid function test 5 - Passed\n')
else
  fprintf('Sigmoid function test 5 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  % fprintf('%f', y-x)
end

v =  reshape(-1:.1:.9, 4, 5);
x = sigmoid(v);
y =  [   0.26894   0.35434   0.45017   0.54983   0.64566;
   0.28905   0.37754   0.47502   0.57444   0.66819;
   0.31003   0.40131   0.50000   0.59869   0.68997;
   0.33181   0.42556   0.52498   0.62246   0.71095;];
if unitTest(x, y)
  fprintf('Sigmoid function test 6 - Passed\n')
else
  fprintf('Sigmoid function test 6 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  % fprintf('%f', y-x)
end

% ----------------
% costFunction
X = [ones(3,1) magic(3)];
y = [1 0 1]';
theta = [-2 -1 1 2]';

% un-regularized
[j g] = costFunction(theta, X, y);

% results
x =  j;
y = 4.68316;

if unitTest(x, y)
  fprintf('Cost function test 1 - Passed\n')
else
  fprintf('Cost function test 1 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  % fprintf('%f', y-x)
end

x = g;
y = [  0.31722;   0.87232;  1.64812;  2.23787  ];

if unitTest(x, y)
  fprintf('Gradient function test 1 - Passed\n')
else
  fprintf('Gradient function test 1 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  % fprintf('%f', y-x)
end


% regularized
[j g] = costFunctionReg(theta, X, y);
% note: also works for ex3 lrCostFunction(theta, X, y, 4)

% results
% j =  8.6832
% g =
%
%    0.31722
%   -0.46102
%    2.98146
%    4.90454

% size(X) - 100x3
% size(y) - 100x1
% size(initial_theta) - 100 * 3

% Compute and display cost and gradient with non-zero theta
% test_theta = [-24; 0.2; 0.2];
% [cost, grad] = costFunction(test_theta, X, y);
%
% fprintf('\nCost at test theta: %f\n', cost);
% fprintf('Expected cost (approx): 0.218\n');
% fprintf('Gradient at test theta: \n');
% fprintf(' %f \n', grad);
% fprintf('Expected gradients (approx):\n 0.043\n 2.566\n 2.647\n');

% -----------------
% test case for predict()
X = [1 1 ; 1 2.5 ; 1 3 ; 1 4];
theta = [-3.5 ; 1.3];
x = predict(theta, X);
y = [0;0;1;1];
if unitTest(x, y)
  fprintf('Predict function test 1 - Passed\n')
else
  fprintf('Predict function test 1 - Failed\n')
  fprintf('Expected Value: %f, Actual value: %f\n', y, x) %'%s\n'(?2:\);)(?2:\);
  % fprintf('%f', y-x)
end
