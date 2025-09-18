import numpy as np

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Add bias column to X
X_with_bias = np.c_[np.ones(X.shape[0]), X]

# Calculate weights using normal equation: w = (X^T * X)^(-1) * X^T * y
weights = np.linalg.inv(X_with_bias.T @ X_with_bias) @ X_with_bias.T @ y

# Extract weight and bias
calculated_weight = weights[1][0]
calculated_bias = weights[0][0]

print("Model weights:")
print(f"Weight: {calculated_weight:.4f}")
print(f"Bias: {calculated_bias:.4f}")

# Make a prediction
sample_input = 5.0
prediction = calculated_weight * sample_input + calculated_bias
print(f"\nPrediction for input 5.0: {prediction:.4f}")

# Save weights to a file
np.save('linear_regression_weights.npy', weights)
print("\nModel weights saved as 'linear_regression_weights.npy'")
