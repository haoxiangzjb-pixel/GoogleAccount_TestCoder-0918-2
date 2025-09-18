import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import os

# Limit TensorFlow threads to avoid issues
tf.config.threading.set_inter_op_parallelism_threads(1)
tf.config.threading.set_intra_op_parallelism_threads(1)

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model using Input layer as recommended
inputs = tf.keras.Input(shape=(1,))
outputs = tf.keras.layers.Dense(1)(inputs)
model = tf.keras.Model(inputs=inputs, outputs=outputs)

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error'
)

# Train the model
history = model.fit(X, y, epochs=100, verbose=0)

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss}")

# Make predictions
predictions = model.predict(X[:5])
print(f"Sample predictions: {predictions.flatten()}")
print(f"Actual values: {y[:5].flatten()}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")