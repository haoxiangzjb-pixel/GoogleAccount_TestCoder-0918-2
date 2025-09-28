import tensorflow as tf
import numpy as np

# Generate some dummy data for demonstration
# Features (X) and labels (y) with a known relationship y = 2*X + 1 + noise
X_data = np.random.randn(1000, 1).astype(np.float32)
y_data = 2 * X_data + 1 + 0.1 * np.random.randn(1000, 1).astype(np.float32)

# Define the model using tf.keras.Sequential
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model with an optimizer and loss function
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_data, y_data, epochs=100, verbose=0)

# Print the learned weights (should be close to slope=2 and bias=1)
weights, bias = model.layers[0].get_weights()
print(f"Learned slope (weight): {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

print("Model training complete.")