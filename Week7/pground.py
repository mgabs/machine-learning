import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

# import sklearn

"""Math behind Large Margin Classification"""

u = np.array([10, 20])
v = np.array([30, 70])
np.dot(u, v)

np.transpose(u)


# Gaussian Kernel
from mpl_toolkits.mplot3d import Axes3D

x_lin = np.array([1,2,3,4,5,6,7,8,9,10])
y_lin = np.array([2,2,3,2,2,9,6,8,8,9])
label_lin = np.array([0,0,0,0,0,1,1,1,1,1])

fig = plt.figure()
ax=fig.add_subplot(111)
plt.scatter(x_lin, y_lin, c=label_lin, s=60)
plt.plot([-2.5, 10], [12.5, -2.5], 'k-', lw=2)
ax.set_xlim([-5,15])
ax.set_ylim([-5,15])
plt.show()

# In the figure below, we plot a dataset which is not linearly separable. If we draw a straight line, most of the points will be not be classified in the correct class.
#
# One way to tackle this problem is to take the dataset and transform the data in another feature map. It means, you will use a function to transform the data in another plan, which should be linearable.

x = np.array([1,1,2,3,3,6,6,6,9,9,10,11,12,13,16,18])
y = np.array([18,13,9,6,15,11,6,3,5,2,10,5,6,1,3,1])
label = np.array([1,1,1,1,0,0,0,1,0,1,0,0,0,1,0,1])

fig = plt.figure()
plt.scatter(x, y, c=label, s=60)
plt.show()

### illustration purpose
def mapping(x, y):
	x = np.c_[(x, y)]
	if len(x) >	2:
		x_1 = x[:,0]**2
		x_2 = np.sqrt(2)*x[:,0]*x[:,1]
		x_3 = x[:,1]**2
	else:
		x_1 = x[0]**2
		x_2 = np.sqrt(2)*x[0]*x[1]
		x_3 = x[1]**2
	trans_x = np.array([x_1, x_2, x_3])
	return trans_x

x_1  = mapping(x, y)
x_1.shape

# Let's make a new plot with 3 axis, x, y and z respectively.

# plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(x_1[0], x_1[1], x_1[2], c=label, s=60)
ax.view_init(30, 185)
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
plt.show()

# We see an improvement but if we change the orientation of the plot, it is clear that the dataset is now separable

# plot
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(x_1[0], x_1[1], x_1[1], c=label, s=60)
ax.view_init(0, -180)
ax.set_ylim([150,-50])
ax.set_zlim([-10000,10000])
ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')
plt.show()


"""What is a Kernel in machine learning?

The idea is to use a higher-dimension feature space to make the data almost linearly separable as shown in the figure above.

There are plenty of higher dimensional spaces to make the data points separable. For instance, we have shown that the polynomial mapping is a great start.

We have also demonstrated that with lots of data, these transformation is not efficient. Instead, you can use a kernel function to modify the data without changing to a new feature plan. """

"""Let's see an example to understand the concept of Kernel. You have two vectors, x1 and x2. The objective is to create a higher dimension by using a polynomial mapping. The output is equal to the dot product of the new feature map. From the method above, you need to:

    1.Transform x1 and x2 into a new dimension
    2.Compute the dot product: common to all kernels
    3.Transform x1 and x2 into a new dimension

You can use the function created above to compute the higher dimension.
"""
## Kernel
x1 = np.array([3,6])
x2 = np.array([10,10])

x_1 = mapping(x1, x2)
print(x_1)
## Compute the dot product

# You can use the object dot from numpy to compute the dot product between the first and second vector stored in x_1.

print(np.dot(x_1[:,0], x_1[:,1]))

# Instead, you can use the polynomial kernel to compute the dot product without transforming the vector. This function computes the dot product of x1 and x2 as if these two vectors have been transformed into the higher dimension. Said differently, a kernel function computes the results of the dot product from another feature space.

# You can write the polynomial kernel function in Python as follow.

def polynomial_kernel(x, y, p=2):
	return (np.dot(x, y)) ** p

polynomial_kernel(x1, x2, p=2)

# Type of Kernel Methods

# There are lots of different kernels available. The simplest is the linear kernel. This function works pretty well for text classification. The other kernel is:

    # Polynomial kernel
    # Gaussian Kernel
