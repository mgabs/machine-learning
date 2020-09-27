# Large scale machine learning

## Batch Gradient descent

$cost(θ, (x^{(i)},y^{(i)}))=\frac1{2m} ∑_{i=1}^m( h_θ(x^{(i)}) - y^{(i)})^2 $
Repeat {
  $ θ_j := θ\_j - α\frac1m  ∑_{i=1}^m( h\_θ(x^{(i)}) - y^{(i)})x_j^{(i)}$
  (for every j=0, .., n)
}

-   The computation is done by summation over m
-   Linear gradient descent, computing the θ is expensive for large dataset.

## Stochastic gradient descent

$cost(θ, (x^{(i)},y^{(i)}))=\frac12 ( h_θ(x^{(i)}) - y^{(i)})^2 $
$J_{train(θ)} = \frac1m ∑\_{(i=1)}^m cost(θ, (x^{(i)}, y^{(i)}))^2 $

-   Repeat for {
      for i = 1, .., m
      $ θ_j := θ\_j - α ( h_θ(x^{(i)}) - y^{(i)})x_j^{(i)}$
      (for every j=0, .., n)
    }

## Mini-batch gradient descent
Say b = 10, m = 1000.
Repeat {
  for i = 1, 11, 21, 31, .., 991{
    $ θ_j := θ\_j - α\frac1{10}  ∑_{k=1}^{i+9}( h\_θ(x^{(k)}) - y^{(k)})x_j^{(k)}$
    (for every j=0, .., n)
  }
}

- Enhance performance through the use of vectorization.
- Performance improvements will only be noticed if we have a good vectorization implementation
- need an assumption for b value, mini-batch size

# Online Learning

## Price estimation
  Repeat forever {
    Get (x,y) corresponding to user.
    Update θ using (x,y):
      $ θ_j := θ\_j - α ( h\_θ(x) - y)x_j$
      (j=0, .., n)
  }

## Product search
  - Return results to a user search
  - Predicted Click-through Rate
    Learn $p(y=1|x;θ)$
    {  
      y=1 if user clicks on link.
      y=0 otherwise.
    }

# Map Reduce

Batch gradient descent:
m = 400
$ θ_j := θ\_j - α\frac1{400}  ∑_{i=1}^{400}( h\_θ(x^{(i)}) - y^{(i)})x_j^{(i)}$
(Machine1: use (x1, y1), .., (x100, y100))
 
