Q2
Which of the following are true? Check all that apply.
1 point

J(θ)J(\theta)J(θ) will be a convex function, so gradient descent should converge to the global minimum.

Adding polynomial features (e.g., instead using hθ(x)=g(θ0+θ1x1+θ2x2+θ3x12+θ4x1x2+θ5x22)h_\theta(x) = g(\theta_0 + \theta_1x_1 + \theta_2 x_2 + \theta_3 x_1^2 + \theta_4 x_1 x_2 + \theta_5 x_2^2)hθ​(x)=g(θ0​+θ1​x1​+θ2​x2​+θ3​x12​+θ4​x1​x2​+θ5​x22​) ) could increase how well we can fit the training data.

The positive and negative examples cannot be separated using a straight line. So, gradient descent will fail to converge.

Because the positive and negative examples cannot be separated using a straight line, linear regression will perform as well as logistic regression on this data.

REVIEW - https://www.coursera.org/learn/machine-learning/lecture/licwf

Q4

Review - https://www.coursera.org/learn/machine-learning/lecture/68Pol

Q5
Which of the following statements are true? Check all that apply.
1 point

The cost function J(θ)J(\theta)J(θ) for logistic regression trained with m≥1m \geq 1m≥1 examples is always greater than or equal to zero.

For logistic regression, sometimes gradient descent will converge to a local minimum (and fail to find the global minimum). This is the reason we prefer more advanced optimization algorithms such as fminunc (conjugate gradient/BFGS/L-BFGS/etc).

The sigmoid function g(z)=11+e−zg(z) = \frac{1}{1 + e^{-z}}g(z)=1+e−z1​ is never greater than one (>1 >1 >1).

Linear regression always works well for classification if you classify by using a threshold on the prediction made by linear regression.
