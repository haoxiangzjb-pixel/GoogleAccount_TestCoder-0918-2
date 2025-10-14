import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# Features (X) and target variable (y) with a linear relationship y = 2*X + 1 + noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))  # Single output, single input
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error') # Using Stochastic Gradient Descent

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

print("Model training completed.")
print(f"Learned weight (slope): {model.layers[0].get_weights()[0][0][0]:.4f}")
print(f"Learned bias: {model.layers[0].get_weights()[1][0]:.4f}")

# Save the model (optional)
# model.save('my_linear_model.h5')