# Classification

## Logistic Regression
$h_θ(x) = g(θ^T x)$
$g(z)=\frac 1{1+e^{-z}}$

Suppose predict $"y=1"$ if $h_θ(x) >= 0.5$
    predict $"y=0"$ if $h_θ(x) < 0.5$

$g(z) >= 0.5$   
when $z >= 0$

The problem with this cost function that it is not convex hence and it doesn't converge.

**Review**
$cost(h_θ(x), y) = $
$- log h_θ(x)    if y = 1$
$-log(1-h_θ(x0))    if y = 0$

*The following are true:*
* if $h_θ(x)=y$, then $cost(h_θ(x), y)=0$ (for $y=0$, $y=1$).
* if $y=0$, then $cost(h_θ(x), y)-> ∞ $ as $h_θ(x)→1$
* Regardless of whether $y=0$ or $y=1$, if $h_θ(x)=0.5$, then $cost(h_θ(x), y)>0$.

### Cost Function for Logistic Regression

$J(\theta)=\frac 1m ∑_{i=1}^m Cost(h_\theta(x^{(i)}), y^{(i)})$
$Cost(h_\theta(x), y) = -log(h_θ(x))$       if $y=1$
$Cost(h_\theta(x), y) = -log(1-hθ(x))$              if $y=0$

**Review point**
* Maximum likelihood estimation
* octave> help fminunc

**A vectorized Implementation**
$θ:= θ-\frac αm X^T(g(Xθ) - ŷ)$
