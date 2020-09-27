# K-Means

- Market Segmentation (K-mean for non-separated clusters)
- Cluster organization
- K-mean for non-separated clusters

## K-mean algorithm

Repeat{
for $i=1 to m$
$c^{(i)}$ := index (from 1 to K) of cluster centroid closest to $x^{(i)}$

for $k=1 to K$
$μ_k$ := average (mean) of points assigned to cluster $k$
}

# Principal Component Analysis (PCA) algorithm

Reduce data dimensions from n-dimensions to k-dimensions
* Normalization & feature scaling

* Computer "covariance matrix":
  $∑ = \frac1m ∑^n_{i=1} (x^{(i)})(x^{(i)})^T$

  or vectorized
  $Sigma = (1/m)* X' * X ;$

* Compute "eigenvectors" of matrix ∑:
  $[U, S, V] = svd(Sigma);$ #Singular value decomposition

* $Ureduce = U(:, 1:k);$
* $z = Ureduce' * x;$

## Choosing $k$ (number of principal components)

* Average squared projection error: $\frac1m ∑_{i=1}^m ||x^{(i)}- x^{(i)}_{approx}||^2$

* Total variation in the data:
  $\frac1m∑_{i=1}^m ||x^{(i)}||^2 $

* Typically, choose k to be the smallest value so that:
$\frac{\frac1m ∑_{i=1}^m ||x^{(i)}- x^{(i)}_{approx}||^2}{\frac1m∑_{i=1}^m ||x^{(i)}||^2} ≤ 0.01$

"99% of variance is retained" - the average squared projection error divided by the total variation was at most 1%""

### Mathematically using SVD (Singular value decomposition)
Pick smallest value of k for which
$[U, S, V] = svd(Sigma)$
$\frac{∑^k_{i=1}S_{ii}}{∑^m_{i=1}S_{ii}} ≥ 0.99$

### Recovering data from PCA

$X_{approx} = U_{reduce} . z^{(i)}$


## Using PCA
* Supervised learning speedup - lowering the dimensions of the input
Applicaions:
* Compress
* Visualize
* Speed gains
* mis-use: prevent over-fitting
