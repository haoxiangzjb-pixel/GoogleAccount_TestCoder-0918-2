import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
# True relationship: y = 2*x + 1 + noise
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model using TensorFlow/Keras
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd',  # stochastic gradient descent
              loss='mean_squared_error',
              metrics=['mae'])  # mean absolute error

# Display model architecture
model.summary()

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True weight: 2.0, True bias: 1.0")

# Make predictions
predictions = model.predict(X)

# Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.6, label='Data points')
plt.plot(X, predictions, color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.grid(True)
plt.show()

# Test the model with new data
test_x = np.array([[1.5], [-1.0], [0.0]], dtype=np.float32)
test_predictions = model.predict(test_x)
print("\nTest predictions:")
for i in range(len(test_x)):
    print(f"Input: {test_x[i][0]:.1f}, Prediction: {test_predictions[i][0]:.3f}")

print("\nModel training completed successfully!")