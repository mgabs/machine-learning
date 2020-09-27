# Problem & motivation

Classifying anomalies, occurances that are not normal and very rare.

## Anomaly detection example

modelling a dataset of values.
Answering a question is the $x\_{test}$ anomalous ?

## Fraud detection

modelling user activities.
Answering the question is this behaviour unusual ?

$x(i)$ features of machine $i$

## Monitoring computers in a data centre

usage anomaly detection

# Gaussian Distribution

Assuming Gaussian Distribution.
$μ = \frac1m ∑_{i=1}^m x^{(i)}$
$σ^2 = \frac1m ∑_{(i)}^m (x^{(i)-μ})^2$

## Density estimation

$p(x)= p(x_1, μ\_1, σ\_1^2) p(x_2, μ\_2, σ\_2^2) .. p(x_j, μ\_j, σ\_j^2)$
$p(x) = ∏_{j=1}^n p(x_j, μ\_j, σ\_j^2)$ ==> The problem of Density Estimation.
$p(x)=  ∏_{j=1}^n \frac1{√2πσ\_j} exp(-\frac{(x_j - μ\_j)^2}{2σ^2_j}) $
Anomaly if p(x) &lt; ϵ

calculating μ & σ
$μ_j = \frac1m ∑_{i=1^m} x_j^{(i)}$
$σ^2_j = \frac1m ∑_{i=1}^m (x_j^{(i)} - μ\_j)^2$

### Alogrithm evaluation

- Fit model
- on cross validation /test example x, predict y
  y = 1 if p(x) &lt; ϵ (anomaly)
  y = 0 if p(x) ≥ ϵ (anomaly)

- Possible evaluation metrics:
  - True positive, false positive, false negative, true negative
  - Preceision / Recall
  - F1-score
- Can also use cv to choose ϵ.

## Multivariate Gaussian Distribution

$p(x, μ, σ) = \frac 1{(2π)^{n/2} ⃒Σ ⃒^{1/2}} exp(-\frac12 (x-μ)^T Σ^{-1} (x-μ))$
$ ⃒Σ ⃒ = delimiter of Σ$

helps increasing the accuracy of the protocl by considering non-uniform probablility shapes that further increase the performance of the model.

The original model corresponds to multivariate Gaussians, where the contours of the Gaussian are always axis aligned.

Original Model: $p(x)= p(x_1, μ\_1, σ\_1^2) p(x_2, μ\_2, σ\_2^2) .. p(x_j, μ\_j, σ\_j^2)$
Multivariate Gaussian model: $p(x, μ, σ) = \frac 1{(2π)^{n/2} ⃒Σ ⃒^{1/2}} exp(-\frac12 (x-μ)^T Σ^{-1} (x-μ))$

### Original model:

- Manually create features to capture anomalies where x1, x2 take unusual combinations
  $x3 = x1/x2$
- computationally cheaper - scales better
- Ok even if m (training set size ) is small

### Multivariate Gaussian model:

- automatically captures correlations between features
- computationally more expensive
- Must have m > n (training set size > number of samples ), or else ∑ is non-invertible
  => m ≥ 10 n

# Recommender system

## Content based recommendation

- First approach: Linear regression (considering we know movies categories)
- Second approach: Collaborative filtering
  - Given \$x^{(1)}, .. , x^{(n^m)} (and movie ratings), can estimate \theta^1, .. \theta^{(n_u)}, can estimate x^{(1)}, .. x^{(n_m)}

### Collaborative filtering

$J(x^{(u_m)}, \theta^{(n_n)}$
- Recommended films
- Similar films
