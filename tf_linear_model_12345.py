import tensorflow as tf
import numpy as np

# Generate random data for demonstration
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + np.random.randn(100, 1).astype(np.float32) * 0.1  # y = 2x + 1 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

# Print the learned parameters
W, b = model.layers[0].get_weights()
print(f"Learned weight: {W[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")

# Make a prediction
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"Prediction for input {sample_input[0][0]}: {prediction[0][0]:.4f}")
