import tensorflow as tf
import numpy as np

# Generate some dummy data for demonstration
# y = 2 * x + 1 + noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + np.random.rand(100, 1).astype(np.float32)

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
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Save the entire model
model.save('linear_regression_trained_model.h5')
print("Model saved as 'linear_regression_trained_model.h5'")