import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import pickle

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X.flatten() + 1 + 0.1 * np.random.randn(100)  # y = 2x + 1 + noise

# Split the data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create and train the model
model = LinearRegression()
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Evaluate the model
mse = mean_squared_error(y_test, y_pred)
print(f"Mean Squared Error: {mse:.4f}")
print(f"Coefficient: {model.coef_[0]:.4f}")
print(f"Intercept: {model.intercept_:.4f}")

# Save the model
with open('linear_regression_model.pkl', 'wb') as f:
    pickle.dump(model, f)
print("Model saved as 'linear_regression_model.pkl'")

# Plot results
plt.scatter(X, y, label='Data')
plt.plot(X, model.predict(X), color='red', label='Prediction')
plt.legend()
plt.title('Linear Regression with Scikit-learn')
plt.show()

# Example of loading the model
with open('linear_regression_model.pkl', 'rb') as f:
    loaded_model = pickle.load(f)
    
# Make a prediction with the loaded model
sample_prediction = loaded_model.predict([[0.5]])
print(f"Prediction for input 0.5: {sample_prediction[0]:.4f}")