# Forward propagation and cost
This tutorial uses the vectorized method. If you're using a for-loop over the training examples, you're doing it the hard way, and you're on your own.
Each of these variables will have a subscript, noting which NN layer it is associated with.

$\varTheta$: A Theta matrix of weights to compute the inner values of the neural network. When we used a vector theta, it was noted with the lower-case theta character $\theta$.

$z$ : is the result of multiplying a data vector with a Θ matrix. A typical variable name would be "z2".

$a$ : The "activation" output from a neural layer. This is always generated using a sigmoid function $g()$ on a $z$ value. A typical variable name would be "a2".

$\delta$ : lower-case delta is used for the "error" term in each layer. A typical variable name would be "d2".

$\Delta$ : upper-case delta is used to hold the sum of the product of a $\delta$ value with the previous layer's $a$ value. In the vectorized solution, these sums are calculated automatically though the magic of matrix algebra. A typical variable name would be "Delta2".

$\Theta$_gradient : This is the thing we're solving for, the partial derivative of theta. There is one of these variables associated with each $\Delta$. These values are returned by nnCostFunction(), so the variable names must be "Theta1_grad" and "Theta2_grad".

$g()$ is the sigmoid function.

$g′()$ is the sigmoid gradient function.

Tip: One handy method for excluding a column of bias units is to use the notation $SomeMatrix(:,2:end)$. This selects all of the rows of a matrix, and omits the entire first column.

## Forward Propagation:

We'll start by outlining the forward propagation process. Though this was already accomplished once during Exercise 3, you'll need to duplicate some of that work because computing the gradients requires some of the intermediate results from forward propagation. Also, the y values in ex4 are a matrix, instead of a vector. This changes the method for computing the cost J.
