import tensorflow as tf
import numpy as np
import os

# Disable oneDNN custom operations for consistent output (optional)
os.environ['TF_ENABLE_ONEDNN_OPTS'] = '0'

# Generate synthetic data for linear regression: y = 2 * x + 1 + noise
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Print a summary of the model
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters (slope and intercept)
slope, intercept = model.layers[0].get_weights()
print(f"\nLearned slope: {slope[0][0]:.4f}")
print(f"Learned intercept: {intercept[0]:.4f}")

# Make a prediction on a new sample
new_x = np.array([[0.5]], dtype=np.float32)
predicted_y = model.predict(new_x, verbose=0)
print(f"\nPrediction for x={new_x[0][0]}: y={predicted_y[0][0]:.4f}")
