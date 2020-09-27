% Load the data from our text file
cd /home/mgaber/Workbench/ML/Octave/linear_regression/
data = load('cricket_chirps_versus_temperature.txt');

% Define x and y
x = data(:,2);
y = data(:,1);

% Function example
function wakeup (message)
  printf ("\a%s\n", message);
endfunction

wakeup('Man')

% Create a function to plot the data
% function plotData (x,y)
%   plot(x,y,'rx','MarkerSize',8); % Plot the data
% endfunction

% Plot the data
function plotData (x,y, marker='rx')
  plot(x,y,marker,'MarkerSize',8); % Plot the data
  xlabel('Rate of Cricket Chirping'); % Set the x-axis label
  ylabel('Temperature in Degrees Fahrenheit'); % Set the y-axis label
  fprintf('Program paused. Press enter to continue.\n');
  pause;
endfunction

plotData(x,y);


% Count how many data points we have
m = length(x);
% Add a column of all ones (intercept term) to x
X = [ones(m, 1) x];

% Calculate theta
theta = (pinv(X'*X))*X'*y

% Plot the fitted equation we got from the regression
hold on; % this keeps our previous plot of the training data visible
plotData(X(:,2), X*theta, marker='-')
legend('Training data', 'Linear regression')
hold off % Don't put any more plots on this figure
