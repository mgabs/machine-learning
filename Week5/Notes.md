# Cost Function
Let's first define a few variables that we will need to use:

* L = total number of layers in the network
* $s_l$​ = number of units (not counting bias unit) in layer l
*  K = number of output units/classes

The cost function for regularized logistic regression was:
$J(\theta)= -\frac 1m ∑_{i=1}^m[y^{(i)} log(h_θ(x^{(i)}))+(1-y^{(i)})log(1-h_θ(x^{(i)}))] + \fracλ{2m}∑_{j=1}^n θ_j^2$

For neural networks, it is going to be slightly more complicated:

$J(\theta)= -\frac 1m ∑_{i=1}^m∑_{k=1}^Ky_k^{(i)} log((h_θ(x^{(i)})))_k+(1-y_k^{(i)})log(1-h_θ(x^{(i)}))_k + \fracλ{2m}∑_{l=1}^{L-1}∑_{i=1}^{s_l} ∑_{j=1}^{s_{l+1}} (θ_{j,i}^{(i)})^2$

We have added a few nested summations to account for our multiple output nodes. In the first part of the equation, before the square brackets, we have an additional nested summation that loops through the number of output nodes.

In the regularization part, after the square brackets, we must account for multiple theta matrices. The number of columns in our current theta matrix is equal to the number of nodes in our current layer (including the bias unit). The number of rows in our current theta matrix is equal to the number of nodes in the next layer (excluding the bias unit). As before with logistic regression, we square every term.

Note:

* the double sum simply adds up the logistic regression costs calculated for each cell in the output layer
* the triple sum simply adds up the squares of all the individual Θs in the entire network.
* the i in the triple sum does not refer to training example i

# Backpropagation Algorithm
"Backpropagation" is neural-network terminology for minimizing our cost function, just like what we were doing with gradient descent in logistic and linear regression. Our goal is to compute:

$\min_\Theta J(\Theta)$

That is, we want to minimize our cost function J using an optimal set of parameters in theta. In this section we'll look at the equations we use to compute the partial derivative of $J(Θ)$:

$\frac{\partial}{\partial \Theta_{i,j}^{(l)}}J(\Theta)$
## Gradient computation

$J(\theta)= -\frac 1m [∑_{i=1}^m∑_{k=1}^Ky_k^{(i)} log((h_θ(x^{(i)})))_k+(1-y_k^{(i)})log(1-h_θ(x^{(i)}))_k ]+ \fracλ{2m}∑_{l=1}^{L-1}∑_{i=1}^{s_l} ∑_{j=1}^{s_{l+1}} (θ_{j,i}^{(i)})^2$

We need to calculate
$J(θ)$
$\fracδ{δθ} J(θ)$

Intuition: $δ_j^{(l)}$ = "error" of node j in layer l.
For each output unit (layer  L=4)
$δ_j^{(4)} = a_j^{(4)} - y_j$
also equals $δ_j^{(4)} = (h_θ(x))_j - y_j$

**vectorized**
$δ^{(4)} = a^{(4)} - y$
$δ^{(3)} = (θ^{(3)})^Tδ^{(4)}.*g'(z(3))$
$δ^{(2)} = (θ^{(2)})^Tδ^{(3)}.*g'(z(2))$
Simplified..
$δ^{(2)} = (θ^{(2)})^Tδ^{(3)}.*a^{(3)}.*(1-a^{(3)})$
No δ^{(1)} since there is no error for the first layer..

Δ -> Capital δ:
$Δ_{ij}^{(l)}=Δ_{ij}^{(l)}+a_j^{(l)}δ_i^{(l+1)}$

The partial derivative of cost function $J(θ)$:
$\frac{\partial}{\partialθ_{ij}^{(i)}}=D_{ij}{(l)}$
equals to:
$D_{ij}^{(l)}=\frac1m Δ_{ij}^{(l)}+λθ_{ij}^{(l)}$ if $j≂̸0$
$Δ_{ij}^{(l)}=Δ_{ij}^{(l)}$ if $j=0$


**Review**
Suppose you have two training examples $(x(1),y(1))(x^{(1)}, y^{(1)})(x(1),y(1))$ and $(x(2),y(2))(x^{(2)}, y^{(2)})(x(2),y(2))$. Which of the following is a correct sequence of operations for computing the gradient?
* FP using $x(1)x^{(1)}x(1)$ followed by BP using $y(1)y^{(1)}y(1)$. Then FP using $x(2)x^{(2)}x(2)$ followed by BP using $y(2)y^{(2)}y(2)$.

### Example
$δ_2^{(4)}=y^{(i)}-a_1^{(4)}$
$δ_2^{(2)}=θ_{12}^{(2)}δ_1^{(3)} + θ_{22}^{(2)}δ_2^{(3)}$
$δ_2^{(3)}=θ_{12}^{(3)}δ_1^{(4)}$

### Matrix & Vector representations
Theta1 = ones(10,11)
Theta2 = 2* ones(10,11)
Theta3 = 3 * ones(10,11)

thetaVector = $[ Theta1(:); Theta2(:); Theta3(:); ]$
deltaVector = $[ D1(:); D2(:); D3(:) ]$

Theta1 = $reshape(thetaVector(1:110),10,11)$
Theta2 = $reshape(thetaVector(111:220),10,11)$
Theta3 = $reshape(thetaVector(221:231),1,11)$

### Gradient Checking
A way to test backprop implementation if it's bug free.

 $\frac ∂{∂θ} J(θ)$≂ GradApprox = $\frac {J(θ + ϵ) - J(θ-ϵ)}{2*ϵ}$

### Random Initialization: Symmetry breaking
Initialize each $θ_{ij}^{(l)}$ to a random value in $[-ϵ, ϵ]$

If the dimensions of Theta1 is 10x11, Theta2 is 10x11 and Theta3 is 1x11.

Theta1 = rand(10,11) * (2 * INIT_EPSILON) - INIT_EPSILON;
Theta2 = rand(10,11) * (2 * INIT_EPSILON) - INIT_EPSILON;
Theta3 = rand(1,11) * (2 * INIT_EPSILON) - INIT_EPSILON;

## Training a Neural network

* Picking a network architecture
  - Number of input units = dimension of features x(i)x^{(i)}x(i)
  - Number of output units = number of classes
  - Number of hidden units per layer = usually more the better (must balance with cost of computation as it increases with more hidden units)
  - Defaults: 1 hidden layer. If you have more than 1 hidden layer, then it is recommended that you have the same number of units in every hidden layer.

* Training a Neural Network
  1. Randomly initialize the weights
  1. Implement forward propagation to get hΘ(x(i))h_\Theta(x^{(i)})hΘ​(x(i)) for any x(i)x^{(i)}x(i)
  1. Implement the cost function
  1. Implement backpropagation to compute partial derivatives
  1. Use gradient checking to confirm that your backpropagation works. Then disable gradient checking.
  1. Use gradient descent or a built-in optimization function to minimize the cost function with the weights in theta.

When we perform forward and back propagation, we loop on every training example:
```
for i = 1:m,
   Perform forward propagation and backpropagation using example (x(i),y(i))
   (Get activations a(l) and delta terms d(l) for l = 2,...,L
```
![image](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/hGk18LsaEea7TQ6MHcgMPA_8de173808f362583eb39cdd0c89ef43e_Screen-Shot-2016-12-05-at-10.40.35-AM.png?expiry=1594339200000&hmac=FmjQN-PSD7y7KPYUY4BYuGf5cSERVr_PsvDvqeGLhtk)

Ideally, you want $h_\Theta(x^{(i)})\approx y^{(i)}$.
This will minimize our cost function. However, keep in mind that J(Θ)J(\Theta)J(Θ) is not convex and thus we can end up in a local minimum instead.

[Putting it all Together](https://www.coursera.org/learn/machine-learning/lecture/Wh6s3/putting-it-together)
[Putting it all Together - Notes](https://www.coursera.org/learn/machine-learning/supplement/Uskwd/putting-it-together)
