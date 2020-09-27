# Multiple features
$x(i)^n_j$
a=[1,2 ]


**Hypothesis**
$h\theta(x) = θ_0 + θ_1 x_1 + θ_2 x_2 + .. + θ_n x_n$

** $x_j(i)$=value of feature j in the ith training example

**Cost Function:**
$J(\theta)= 1/(2m) ∑_{i=1}^m(h_θ(x^{(i)}) - y^{(i)} )^2$

## Gradient Descent in Practice
* Feature scaling
  get every feature into $-1<x_i<1$ range

* Mean normalization
  replace $x_i$ with $x_i-\mu_i$ to make features have approximate zero mean
  $x_i = \frac{x_i - \mu_i}{S_i}$
  where $\mu$ is mean & $S$ is range( Max - min)

* Learning rate
  * Plotting the Cost function Vs Learning rate helps choose an appropriate $\alpha$ aka $lr$
  * Automatic convergence tests.
  Declare convergence if J(θ) decreases by less than E in one iteration, where E is some small value such as $10^{−3}$. However in practice it's difficult to choose this threshold value.

## Features and Polynomial Regression
* Polynomial Regression
  Our hypothesis function need not be linear (a straight line) if that does not fit the data well.

We can change the behaviour or curve of our hypothesis function by making it a quadratic, cubic or square root function (or any other form).

## Computing Parameters Analytically

* **Normal Equation**
  With the normal equation, computing the inversion has complexity $\mathcal{O}(n^3)$. So if we have a very large number of features, the normal equation will be slow. In practice, when n exceeds 10,000 it might be a good time to go from a normal solution to an iterative process.

* **Non Invertible X**
  When working with x we should use $pinv(X)$ to avoid non Invertible matrices
