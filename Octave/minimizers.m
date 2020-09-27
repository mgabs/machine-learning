% Source: http://www.ece.northwestern.edu/local-apps/matlabhelp/toolbox/optim/fminunc.html

% fminbnd() is designed for the simpler, but very common, case of a univariate function where the interval to search is bounded. For unbounded minimization of a function with potentially many variables use fminunc() or fminsearch(). The two functions use different internal algorithms and some knowledge of the objective function is required.

% options is a structure specifying additional options. Currently, fminunc recognizes these options: "FunValCheck", "OutputFcn", "TolX", "TolFun", "MaxIter", "MaxFunEvals", "GradObj", "FinDiffType", "TypicalX", "AutoScaling".

fminsearch (@(x) (x(1)-5).^2+(x(2)-8).^4, [0;0])
fminsearch (inline ("(x(1)-5).^2+(x(2)-8).^4", "x"), [0;0])

% examples:
% example 1
function y = f(x),
  y=3*x(1)^2 + 2*x(1)*x(2) + x(2)^2;  %cost function
end

f([1 0])

x0=[1,1];
[x, fval] = fminunc(@f, x0)

% example 2
function [y, g] = f(x),
  y=3*x(1)^2 + 2*x(1)*x(2) + x(2)^2;  %cost function
  if nargout > 1
    g(1) = 6 * x(1) + 2*x(2);
    g(2) = 2 * x(1) + 2*x(2);
  end
end

% Indicate the gradient value is available by creating an optimization options structure with the GradObj parameter set to 'on' using optimset.

options = optimset('GradObj','on');
x0 = [1,1];
[x,fval] = fminunc(@f,x0,options)

% To minimize the function f(x) = sin(x) + 3 using an inline object

f = inline('sin(x)+3');
x = fminunc(f,4)

% fminunc is not the preferred choice for solving problems that are sums-of-squares, that is, of the form

% Instead use the lsqnonlin function, which has been optimized for problems of this form.
