x = linspace(0, 2*pi);

% Then, we compute the y-values of the 3 functions.

a = cos(2*x);
b = sin(4*x);
c = 2*sin(x);

% The following plots the first graph.

% figure;
% plot(x, a);
% hold on;
% plot(x, b);
% plot(x, c);

% We use line 5 (figure) to tell Octave that we want to plot on a new set of axes. It is good practice to use figure before plotting any new graph. This prevents you from accidentally replacing a previous plot with the new one.
% Note that on line 7, hold on is used to tell Octave that we don't want to replace the first plot (from line 6) with subsequent ones. Octave will plot everything after hold on on the same axes, until the hold off command is issued.
% The figure you see shows all three plotted functions in the same color. To let Octave assign different colors automatically plot all functions in one step.
hold on;
plot(x, a, x, b, x, c);
hold off;
