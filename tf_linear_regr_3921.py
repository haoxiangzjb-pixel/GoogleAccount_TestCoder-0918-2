import tensorflow as tf
import numpy as np

# Generate dummy data
X = np.random.randn(100, 1).astype(np.float32)
y = 3.5 * X + 2.1 + np.random.randn(100, 1).astype(np.float32) * 0.1

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print final weights
final_weights = model.get_weights()
print(f"Final weight: {final_weights[0][0][0]:.4f}")
print(f"Final bias: {final_weights[1][0]:.4f}")

print("Model training completed.")