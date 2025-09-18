import numpy as np
import matplotlib.pyplot as plt
import pickle

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X.flatten() + 1 + 0.1 * np.random.randn(100)  # y = 2x + 1 + noise

# Add a column of ones to X for the intercept term
X_with_intercept = np.c_[np.ones(X.shape[0]), X]

# Calculate the coefficients using the normal equation: theta = (X^T * X)^(-1) * X^T * y
theta = np.linalg.inv(X_with_intercept.T @ X_with_intercept) @ X_with_intercept.T @ y

# Extract the intercept and coefficient
intercept = theta[0]
coefficient = theta[1]

print(f"Coefficient: {coefficient:.4f}")
print(f"Intercept: {intercept:.4f}")

# Make predictions
y_pred = coefficient * X.flatten() + intercept

# Calculate mean squared error
mse = np.mean((y - y_pred) ** 2)
print(f"Mean Squared Error: {mse:.4f}")

# Save the model parameters
model_params = {'intercept': intercept, 'coefficient': coefficient}
with open('linear_regression_model.pkl', 'wb') as f:
    pickle.dump(model_params, f)
print("Model saved as 'linear_regression_model.pkl'")

# Plot results
plt.scatter(X, y, label='Data')
plt.plot(X, y_pred, color='red', label='Prediction')
plt.legend()
plt.title('Linear Regression with NumPy')
plt.xlabel('X')
plt.ylabel('y')
plt.show()

# Example of loading the model
with open('linear_regression_model.pkl', 'rb') as f:
    loaded_params = pickle.load(f)
    
# Make a prediction with the loaded model
sample_x = 0.5
sample_prediction = loaded_params['coefficient'] * sample_x + loaded_params['intercept']
print(f"Prediction for input {sample_x}: {sample_prediction:.4f}")