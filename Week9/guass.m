%% Initialization
pkg load statistics;

clear ; close all; clc

x=[-4:0.1:4];
mu=0;
sigma=1;
y=normpdf(x,mu, sigma);
plot (x,y);

pause;

% hist(x,normpdf(x,0,1));
% pause;
