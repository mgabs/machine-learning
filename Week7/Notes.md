# Support Victor Machine
## Cost function

$min_θ C ∑_{i=1}^m[y^{y(i)}cost_1(θ^Tx^{(i)}) + (1-y^{(i)}) cost_0(θ^Tx^{(i)})] + \frac12 ∑_{i=1}^nθ_j^2$
* If $y=1$, we want $θ^Tx>=1$ (not just >=0)
* If $y=0$, we want $θ^Tx<=-1$ (not just <0)

## SVM Decision Boundary
Large margin classifier: SVM separates the data with the biggest margin between data samples.

## Kernels
### Gaussian Kernel
Given x, compute feature depending on proximity to landmarks $l^{(1)}, l^{(2)},l^{(3)}$
$f1 = similarity(x, l^{(1)}) = exp(-\frac{||x-l^{(1)}||^2}{2σ^2})$
$f2 = similarity(x, l^{(2)}) = exp(-\frac{||x-l^{(2)}||^2}{2σ^2})$
$f3 = similarity(x, l^{(3)}) = exp(-\frac{||x-l^{(3)}||^2}{2σ^2})$

* Generally:
  $K(x_i, x_j) = (a‹x_i, x_j› + b)^n$
* A Gaussian Kernel:
  $K(x_i, x_j) = exp(- \frac {||x_i-x_j||^2}{2σ^2})$

**Do we need to know the appropriate Kernel function first?**

  Yes, we do need to determine which Kernel function will be appropriate. However, we do not need to know it first. First, we have to realize that a linear decision boundary is not going to work. This is realized when we see a poor model accuracy, and some data visualization can be used, if possible. Upon realizing that linear boundary is not going to work, we go for a Kernel trick.

  However, since with Kernel trick there is no additional computation for separating data points in some high-dimension or infinite dimension, people go with the infinite dimension by using the Gaussian (RBF) Kernel. RBF is the most commonly used Kernel

### Notes about Bias and Variance
1. When using an SVM, one of the things you need to choose is the parameter C which
was in the optimization objective So, if you have a large value of C, this corresponds to what we have back in logistic regression, of a small
value of lambda meaning of not using much regularization.
And if you do that, you tend to have a hypothesis with lower bias and higher variance.
Whereas if you use a smaller value of C then this corresponds to when we are using logistic regression with a large value of lambda and that corresponds to a hypothesis with higher bias and lower variance.
And so, hypothesis with large C has a higher variance, and is more prone to overfitting, whereas hypothesis with small C has higher bias and is thus more prone to underfitting.

2. The other one is the parameter sigma squared, which appeared in the Gaussian kernel.
So if the Gaussian kernel sigma squared is large, then in the similarity function, which was this you know E to the minus x minus landmark varies squared over 2 sigma squared.
In this one of the example; If I have only one feature, x1, if I have a landmark there at that location, if sigma squared is large, then, you know, the Gaussian kernel would tend to fall off relatively slowly and so this would be my feature f(i), and so this would be smoother function that varies more smoothly, and so this will give you a hypothesis with higher bias and lower variance, because the Gaussian kernel that falls off smoothly,
you tend to get a hypothesis that varies slowly, or varies smoothly as you change the input x. Whereas in contrast, if sigma squared was small and if that's my landmark given my 1 feature x1, you know, my Gaussian kernel, my similarity function, will vary more abruptly.

# More about SVM
- [Kernel in Statistics](https://en.m.wikipedia.org/wiki/Kernel_(statistics)#In_non-parametric_statistics)
- Octave example: https://upscfever.com/upsc-fever/en/data/en-exercises-21.html
- Neuraxle : [A Pipeline for ML](https://github.com/Neuraxio/Neuraxle)
- [Truly Understanding Kernels](https://towardsdatascience.com/truly-understanding-the-kernel-trick-1aeb11560769)
