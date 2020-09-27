#!/usr/bin/env python
import os
import numpy as np
from scipy.io import loadmat


print('Loading movie ratings dataset.\n\n')
os.chdir("/home/mgaber/Workbench/ML/Week9/exercise/ex8/")
# %  Load movie data
load_data = loadmat('ex8_movies.mat')
Y = load_data['Y']
R = load_data['R']

# We should try to plot
# imagesc(Y);
# ylabel('Movies');
# xlabel('Users');

# load movie params
print('Loading features')
load_data = loadmat('ex8_movieParams.mat')
Theta = load_data['Theta']
X = load_data['X']
num_users = load_data['num_users'].flatten()[0]
num_movies = load_data['num_movies'].flatten()[0]
num_features = load_data['num_features'].flatten()[0]
num_features.flatten()[0]



def cofiCostFunc(X, Theta, Y, R, num_users, num_movies, num_features, lam=0):

    X = X.reshape(num_movies, num_features)
    Theta = Theta.reshape(num_users, num_features)
    Y = Y.reshape(num_movies, num_users)
    R = R.reshape(num_movies, num_users)
    # Theta.shape

    # X = X.reshape()
    # print(X.shape)
    # print(R.shape)
    # Theta = Theta.reshape(Theta.shape[0] * Theta.shape[1], 1)
    # print(Theta.shape)

    reg = (lam / 2) * (np.sum(np.sum(np.square(Theta)) + np.sum(np.square(X))))

    # X_grad = np.product(R, (X* np.transpose(Theta) ) - Y )  * X +  lam * Theta
    X_grad = (np.prod(X, np.transpose(Theta)) - Y) * X + lam * Theta
    # print(reg, X_grad)
    # pass


J = cofiCostFunc(X, Theta, Y, R, num_users, num_movies, num_features, 0)
