import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error'
)

# Train the model
print("Training the model...")
model.fit(X, y, epochs=20, verbose=0)  # Reduced epochs for faster execution

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Model loss: {loss}")

# Make predictions
predictions = model.predict(X[:5])
print(f"Sample predictions: {predictions.flatten()}")
print(f"Actual values: {y[:5].flatten()}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")

# Plot results
plt.scatter(X, y, label='Data')
plt.plot(X, model.predict(X), color='red', label='Prediction')
plt.legend()
plt.title('Linear Regression with TensorFlow')
plt.savefig('linear_regression_plot.png')
print("Plot saved as 'linear_regression_plot.png'")