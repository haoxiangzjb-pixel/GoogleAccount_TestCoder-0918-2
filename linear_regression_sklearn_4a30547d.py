import numpy as np
from sklearn.linear_model import LinearRegression
import joblib

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X.flatten() + 1 + 0.1 * np.random.randn(100)

# Create and train the model
model = LinearRegression()
model.fit(X, y)

# Evaluate the model
score = model.score(X, y)
print(f"Model R² score: {score}")

# Make predictions
predictions = model.predict([[0.0], [1.0], [2.0]])
print(f"Predictions for [0.0, 1.0, 2.0]: {predictions}")

# Save the model
joblib.dump(model, 'linear_regression_model.pkl')
print("Model saved as 'linear_regression_model.pkl'")

# Print model parameters
print(f"Model coefficient: {model.coef_[0]}")
print(f"Model intercept: {model.intercept_}")