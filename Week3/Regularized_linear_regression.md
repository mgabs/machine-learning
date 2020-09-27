# Regularized Linear Regression

## Gradient Descent
Repeat {
$θ_j := θ_j - α \frac 1m ∑_{i=1}^m (h_θ(x^{(i)}) - y^(i)) x_j^{(i)}$
for $(j= 0,1,2, ..., n)$
}

## Regularized Cost Function
$J(θ) = -[\frac 1m ∑_{i=1}^m h_θ(x^{(i)}) + (1 - y^{(i)}log(1-h_θ(x^{(i)})) )]$

## Gradient Descent with Regularized function
Repeat {
$θ_0 := θ_0 - α \frac 1m ∑_{i=1}^m (h_θ(x^{(i)}) - y^(i)) x_j^{(i)}$

$θ_j := θ_j - α \frac 1m ∑_{i=1}^m (h_θ(x^{(i)}) - y^(i)) x_j^{(i)} + \frac λm θ_j$

for $(j= 1,2, ..., n)$
}

$θ_j := θ_j(1-α\frac λm) - α \frac 1m ∑_{i=1}^m (h_θ(x^{(i)}) - y^(i)) x_j^{(i)} $

Note: $1-α\frac λm < 1$


## Normal Equation
$θ = X^TX + λ.L^{-1}X^Ty$
where $L=\left(\begin{array}
10 & 0 & 0\\
0 & 1 & 0\\
0 & 0 & 1
\end{array}\right)$
