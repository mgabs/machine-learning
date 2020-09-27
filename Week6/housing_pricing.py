from sklearn.datasets import load_boston
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# pip install keras
# pip install tensorflow
# pip install shap

# Importing the dataset
boston_dataset = load_boston()

df = pd.DataFrame(boston_dataset.data, columns=boston_dataset.feature_names)
df['MEDV'] = boston_dataset.target

# df.head(n=10)

# Data preprocessing
from sklearn.model_selection import train_test_split

X = df.loc[:, df.columns != 'MEDV']
y = df.loc[:, df.columns == 'MEDV']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=123)

# Normalization & standardization
# In order to provide a standardized input to our neural network, we need the perform the normalization of our dataset. This can be seen as an step to reduce the differences in scale that may arise from the existent features. We perform this normalization by subtracting the mean from our data and dividing it by the standard deviation. One more time, this normalization should only be performed by using the mean and standard deviation from the training set, in order to avoid any information leak from the test set.

mean = X_train.mean(axis=0)
std = X_train.std(axis=0)

X_train = (X_train - mean) / std
X_test = (X_test - mean) / std

# Build our model
import tensorflow.keras as keras
from keras.models import Sequential
from keras.layers import Dense

model = Sequential()

model.add(Dense(128, input_shape=(13, ), activation='relu', name='dense_1'))
model.add(Dense(64, activation='relu', name='dense_2'))
model.add(Dense(1, activation='linear', name='dense_output'))

model.compile(optimizer='adam', loss='mse', metrics=['mae'])
model.summary()

# Train our model
history = model.fit(X_train, y_train, epochs=100, validation_split=0.05)

# plotting both loss and mean average error
plt.figure(figsize=(10, 6))
plt.xlabel('Epoch')
plt.ylabel('Loss')
sns.lineplot(x = range(0,100), y=history.history['loss'], color='blue', label='Train')
sns.lineplot(x = range(0,100), y=history.history['val_loss'], color='red', label='Valid')

# second plot
plt.figure(figsize=(10, 6))
plt.xlabel('Epoch')
plt.ylabel('MAE')
sns.lineplot(x = range(0,100), y=history.history['mae'], color='blue', label='Train')
sns.lineplot(x = range(0,100), y=history.history['val_mae'], legend='full', color='red', label='Valid')

# Evaluate our model
mse_nn, mae_nn = model.evaluate(X_test, y_test)

print('Mean squared error on test data: ', mse_nn)
print('Mean absolute error on test data: ', mae_nn)


# Opening the Black Box (a.k.a. Explaining our Model)
import shap
shap.initjs()

explainer = shap.DeepExplainer(model, X_train[:100].values)
shap_values = explainer.shap_values(X_test[:100].values)
plt.figure(figsize=(10, 6))
shap.summary_plot(shap_values, X_test, plot_type='bar')
