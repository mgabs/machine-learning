% setup the correct path for octave kernel
% pwd
% cd /home/mgaber/Workbench/ML/Week2/assignment/ex1
% -----------------

% computeCostMulti
X = [ 2 1 3; 7 1 9; 1 8 1; 3 7 4 ];
y = [2 ; 5 ; 5 ; 6];
theta_test = [0.4 ; 0.6 ; 0.8];
computeCostMulti( X, y, theta_test )
% result
% ans =  5.2950
% ----------------------

% gradientDescentMulti
X = [ 2 1 3; 7 1 9; 1 8 1; 3 7 4 ];
y = [2 ; 5 ; 5 ; 6];
[theta J_hist] = gradientDescentMulti(X, y, zeros(3,1), 0.01, 100);

% results
theta

theta =

   0.23680
   0.56524
   0.31248

>> J_hist(1)
ans =  2.8299

J_hist(end)
ans =  0.0017196
% -------------------

% normalEqn
X = [ 2 1 3; 7 1 9; 1 8 1; 3 7 4 ];
y = [2 ; 5 ; 5 ; 6];
theta = normalEqn(X,y)

% results
theta =

   0.0083857
   0.5681342
   0.4863732
% -----------------
for alpha = 0.01:5.05,
   disp(alpha)
end

ind = 1:10
for i=1:10:2,
  disp(i);
  end;

  i = 0.01;
  while i <= 0.05,
    disp(i);
    i = i+0.01;
  end;
