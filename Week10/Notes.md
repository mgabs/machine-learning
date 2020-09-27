# Large scale machine learning

## Batch Gradient descent

$cost(θ, (x^{(i)},y^{(i)}))=\\frac1{2m} ∑_{i=1}^m( h_θ(x^{(i)}) - y^{(i)})^2 $
Repeat {
  $ θ_j := θ\_j - α\\frac1m  ∑_{i=1}^m( h\_θ(x^{(i)}) - y^{(i)})x_j^{(i)}$
  (for every j=0, .., n)
}

-   The computation is done by summation over m
-   Linear gradient descent, computing the θ is expensive for large dataset.

## Stochastic gradient descent

$cost(θ, (x^{(i)},y^{(i)}))=\\frac12 ( h_θ(x^{(i)}) - y^{(i)})^2 $
$J_{train(θ)} = \\frac1m ∑\_{(i=1)}^m cost(θ, (x^{(i)}, y^{(i)}))^2 $

-   Repeat for {
      for i = 1, .., m
      $ θ_j := θ\_j - α ( h_θ(x^{(i)}) - y^{(i)})x_j^{(i)}$
      (for every j=0, .., n)
    }

## Mini-batch gradient descent
Say b = 10, m = 1000.
Repeat {
  for i = 1, 11, 21, 31, .., 991{
    $ θ_j := θ\_j - α\\frac1{10}  ∑_{k=1}^{i+9}( h\_θ(x^{(k)}) - y^{(k)})x_j^{(k)}$
    (for every j=0, .., n)
  }
}

- Enhance performance through the use of vectorization.
- Performance improvements will only be noticed if we have a good vectorization implementation
- need an assumption for b value, mini-batch size
