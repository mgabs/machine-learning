(Resource)[https://www.coursera.org/learn/machine-learning/resources/NrY2G]
(discussion forum)[https://www.coursera.org/learn/machine-learning/discussions]

(Exercises in Python)[https://stevenpzchan.github.io/ml_dl_coursera_Andrew_Ng/]

# Week 1

Tom Mitchell - Carnegie Melon.
"A well-posed learning problem is defined as follows, a computer program is said to learn from experience E with respect to some task T and some performance measure P, if its performance on T,as measured by P, improves with experience E.

Example: playing checkers.

E = the experience of playing many games of checkers
T = the task of playing checkers.
P = the probability that the program will win the next game.

In general, any machine learning problem can be assigned to one of two broad classifications:
Supervised learning and Unsupervised learning."

## Hypothesis

statistical hypothesis, sometimes called confirmatory data analysis, is a hypothesis that is testable on the basis of observing a process that is modeled via a set of random variables

1. Initial Research Hypothesis
2. state the relevant **null** and **alternative hypothesis**.
3. consider the statistical assumptions being made about the sample in doing the test.
4. Decide on approperiate test, state the relevant **test statistic T**.
5. Derive the distrubtion of the test statistic under the null hypothesis from the assumptions.
6. Select a significance level (α), a probability threshold below which the null hypothesis will be rejected. Common values are 5% and 1%.
7. The distribution of the test statistic under the null hypothesis partitions the possible values of T into those for which the null hypothesis is rejected—the so-called critical region—and those for which it is not. The probability of the critical region is α.
8. Compute from the observations the observed value tobs of the test statistic T.
9. Decide to either reject the null hypothesis in favor of the alternative or not reject it. The decision rule is to reject the null hypothesis H0 if the observed value tobs is in the critical region, and to accept or "fail to reject" the hypothesis otherwise.

An alternative process is commonly used:

1. Compute from the observations the observed value tobs of the test statistic T.
2. Calculate the p-value. This is the probability, under the null hypothesis, of sampling a test statistic at least as extreme as that which was observed.
3. Reject the null hypothesis, in favor of the alternative hypothesis, if and only if the p-value is less than (or equal to) the significance level (the selected probability) threshold ( α {\displaystyle \alpha } \alpha ).

## Review:

[Testing Hypothesis p-values](https://www.khanacademy.org/math/statistics-probability/significance-tests-one-sample/more-significance-testing-videos/v/hypothesis-testing-and-p-values)

## Notes

- Housing Prices:

  Hypothesis:

  $h_\theta(x) = \theta_0+\theta_1x$

- Drawing a contour

```
x = linspace(-2*pi,2*pi);
y = linspace(0,4*pi^2);
[X,Y] = meshgrid(x,y);
Z = sin(X)+cos(Y);
contour3(X,Y,Z)

contour3 (peaks (19));
colormap cool;
hold on;
surf (peaks (19), "facecolor", "none", "edgecolor", "black");
hold off;
```

(Note 1)[]


$\theta(x) = \theta_0 + \theta_1xhθ​(x)$

x,y
