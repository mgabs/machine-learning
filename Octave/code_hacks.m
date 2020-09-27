% fminbnd() is designed for the simpler, but very common, case of a univariate function where the interval to search is bounded. For unbounded minimization of a function with potentially many variables use fminunc() or fminsearch(). The two functions use different internal algorithms and some knowledge of the objective function is required.

% options is a structure specifying additional options. Currently, fminunc recognizes these options: "FunValCheck", "OutputFcn", "TolX", "TolFun", "MaxIter", "MaxFunEvals", "GradObj", "FinDiffType", "TypicalX", "AutoScaling".

fminsearch (@(x) (x(1)-5).^2+(x(2)-8).^4, [0;0])
fminsearch (inline ("(x(1)-5).^2+(x(2)-8).^4", "x"), [0;0])

% -----------

% Anonymous functions, for a few reasons:
%
%     1. to make a quick function for one-off uses, like 3x^2+2x+7. (see listing below) This is useful for functions like quad and fminbnd that take functions as arguments. It's also convenient in scripts (.m files that don't start with a function header) since unlike true functions you can't include subfunctions.
%     2. for closures -- although anonymous functions are a little limiting as there doesn't seem to be a way to have assignment within them to mutate state.

% quick functions
f = @(x) 3*x.^2 + 2*x + 7;
t = (0:0.001:1);
plot(t,f(t),t,f(2*t),t,f(3*t));

% closures (linfunc below is a function that returns a function,
% and the outer functions arguments are held for the lifetime
% of the returned function.
linfunc = @(m,b) @(x) m*x+b;
C2F = linfunc(9/5, 32);
F2C = linfunc(5/9, -32*5/9);

% -----------------
% useful abbreviations

flat=@(x) x(:);

% print basic statistics
stats=@(x) sprintf('mean +/- s.d. \t= %f +/- %f\nmin, max \t\t= %f, %f\nmedian, mode \t= %f, %f', ...
    mean(flat(x)), std(flat(x)), min(flat(x)), max(flat(x)), median(flat(x)), mode(flat(x)) );

nrows=@(x) size(x,1);
ncols=@(x) size(x,2);
nslices=@(x) size(x,3);

% this is just like ndims except it returns 0 for an empty matrix and
% ignores dimensions of size 0.
ndim=@(x) length(find(size(x)));

% --------------
% Using persistent (static) variables when running an online algorithm. It may speed up the code in areas like Bayesian machine learning where the model is trained iteratively for the new samples. For example, for computing the independent loglikelihoods, I compute the loglikelihood initially from scratch and update it by summing this previously computed loglikelihood and the additional loglikelihood.
%
% Instead of giving a more specialized machine learning problem, let me give a general online averaging code which I took from here:

function av = runningAverage(x)
% The number of values entered so far - declared persistent.
persistent n;
% The sum of values entered so far - declared persistent.
persistent sumOfX;
if x == 'reset' % Initialise the persistent variables.
    n = 0;
    sumOfX = 0;
    av = 0;
else % A data value has been added.
    n = n + 1;
    sumOfX = sumOfX + x;
    av = sumOfX / n; % Update the running average.
end

% Then, the calls will give the following results

runningAverage('reset')
% ans = 0
>> runningAverage(5)
% ans = 5
>> runningAverage(10)
% ans = 7.5000
>> runningAverage(3)
% ans = 6
>> runningAverage('reset')
% ans = 0
>> runningAverage(8)
% ans = 8

% ------------------
% Using xlim and ylim to draw vertical and horizontal lines. Examples:

    % 1.Draw a horizontal line at y=10:
    line(xlim, [10 10])

    % 2. Draw vertical line at x=5:
    line([5 5], ylim)




% print basic statistics
stats=@(x) sprintf('mean +/- s.d. \t= %f +/- %f\nmin, max \t\t= %f, %f\nmedian, mode \t= %f, %f', ...
    mean(flat(x)), std(flat(x)), min(flat(x)), max(flat(x)), median(flat(x)), mode(flat(x)) );

nrows=@(x) size(x,1);
ncols=@(x) size(x,2);
nslices=@(x) size(x,3);

% this is just like ndims except it returns 0 for an empty matrix and
% ignores dimensions of size 0.
ndim=@(x) length(find(size(x)));

% -----------
% The colon operator for the manipulation of arrays.

x=rand(10,10);
flattened=x(:);
Acolumn=x(:,10);
Arow=x(10,:);

y=rand(100);
firstSix=y(1:6);
lastSix=y(end-5:end);
alternate=y(1:2:end);

% ------------------
% When Octave starts, it looks for commands to execute from the files in the following list. These files may contain any valid Octave commands, including function definitions.
%
% octave-home/share/octave/site/m/startup/octaverc
%
%     where octave-home is the directory in which Octave is installed (the default is /usr/local). This file is provided so that changes to the default Octave environment can be made globally for all users at your site for all versions of Octave you have installed. Care should be taken when making changes to this file since all users of Octave at your site will be affected. The default file may be overridden by the environment variable OCTAVE_SITE_INITFILE.
% octave-home/share/octave/version/m/startup/octaverc
%
%     where octave-home is the directory in which Octave is installed (the default is /usr/local), and version is the version number of Octave. This file is provided so that changes to the default Octave environment can be made globally for all users of a particular version of Octave. Care should be taken when making changes to this file since all users of Octave at your site will be affected. The default file may be overridden by the environment variable OCTAVE_VERSION_INITFILE.
% ~/.octaverc
%
%     This file is used to make personal changes to the default Octave environment.

% ---------------

% Using the built-in profiler to see where the hot parts of my code are:

profile on
% some lines of code
profile off
profile viewer

% or just using the built in tic and toc to get quick timings:

tic;
% some lines of code
toc;
