# Non-Linear Hypotheses

For non-linear classification, Polynomial Logistic regressions only works when the number of features is small  - This is where need Deep learning.
```
50 * 50 pixels = 2500
grayscale pixels (0-255 ) = 2500
~ 3,000,000
rgb pixels (3 * 250 )=  2500 * 3 = 7500
```

# Model Representation
## A Neural Network example
$a_1^{(2)}=g⟨θ_{10}^{(1)}x_0+θ_{11}^{(1)}x_1+θ_{12}^{(1)}x_2+θ_{13}^{(1)}x_3⟩$

$a_2^{(2)}=g(Θ_{20}^{(1)}x_0+Θ_{21}^{(1)}x_1+Θ_{22}^{(1)}x_2+Θ_{23}^{(1)}x_3)$
$a_3^{(2)}=g(θ_{30}^{(1)}x_0+Θ_{31}^{(1)}x_1+Θ_{32}^{(1)}x_2+Θ_{33}^{(1)}x_3)$
$h_Θ^{(x)}=a_1^{(3)}=g(θ_{10}^{(2)}a_0^{(2)}+Θ_{11}^{(2)}a_1^{(2)}+Θ_{12}^{(2)}a_2^{(2)}+Θ_{13}^{(2)}a_3^{(2)})$

**In a vectorized implementation, we would use variable $z$**
$a_1^{(2)}=g(z_1^{(2)})$
$a_2^{(2)}=g(z_2^{(2)})$
$a_3^{(2)}=g(z_3^{(2)})$

***In other words, for layer j=2 and node k, the variable z will be:***
$z_k^{(2)} = θ_{k,0}^{(1)}x_0 + θ_{k,1}^{(1)}x_1 + .. + θ_{k,n}^{(1)}x_n$

***Setting $x=a^{(1)}$, we can rewrite the equation as:***
$z^{(j)}=θ^{(j-1)}a^{(j-1)}$
$a^{(j)} = g(z^{(j)})$
where our function $g$ can be applied element-wise to our vector $z^{(j)}$.
Adding a bias unit.
$z^{(j+1)}=θ^{(j)}a^{(j)}$
And Final result.
$h_θ{(x)}=a^{(j+1)} = g(z^{(j+1)})$

Notice that in this last step, between layer j and layer j+1, we are doing exactly the same thing as we did in logistic regression. Adding all these intermediate layers in neural networks allows us to more elegantly produce interesting and more complex non-linear hypotheses.

### Truth table - Lecture example
X1 | X2 | $h_θ(x)$
--|---|--
  0| 0  |  g(-10)~0
  0| 1  |  g(10)~1
  1| 0  |  g(10)~1
  1| 1  |  g(30)~1

**$x1 ⩔ x2$**

$x1$ | $x2$ | $a_1^{(2)}$| $a_1^{(2)}$ |$h_θ(x)$
--|---|---|---|--
0| 0  | 0 | 1 | g(10)~1
0| 1  | 0 | 0 | g(-10)~0
1| 0  | 0 | 0 | g(-10)~0
1| 1  | 1 | 0 | g(10)~1
**$x1$ XNOR $x2$**

## Multi-class classification
Previously, we had written out the labels as $y$ being an integer from $[1, 2, 3, 4]$.

Instead of representing $y$ this way, we're going to instead represent $y$
as follows: namely $Yi$ will be either $[1, 0, 0, 0]$ or $[0, 1, 0, 0]$ or $[0, 0, 1, 0]$ or $[0, 0, 0, 1]$ depending on what the corresponding image $Xi$ is.
And so one training example will be one pair $Xi$ colon $Yi$ where Xi is an image with, you know one of the four objects and $Yi$ will be one of these vectors.

$y^{(i)} =
\begin{bmatrix}1 \\ 0 \\ 0 \\0 \\\end{bmatrix}\begin{bmatrix}0 \\1 \\ 0 \\ 0\end{bmatrix}\begin{bmatrix}0 \\0 \\1 \\ 0\end{bmatrix}\begin{bmatrix}0 \\0 \\0\\ 1\\ \end{bmatrix}$

And the resulting hypothesis for one set of inputs may look like:
$h_θ(x) = [0010]$


## Quiz

X1 | X2 | $h_θ(x)$
--|---|--
  0| 0  |  g(-20)~0
  0| 1  |  g(-10)~0
  1| 0  |  g(-10)~0
  1| 1  |  g(10)~1


1. Which of the following statements are true? Check all that apply.
0 / 1 point - False

4. You'd like to compute the activations of the hidden layer a(2)∈R3a^{(2)} \in \mathbb{R}^3a(2)∈R3. One way to do so is the following Octave code: - False

5. How will this change the value of the output hΘ(x)h_\Theta(x)hΘ​(x)? - False
