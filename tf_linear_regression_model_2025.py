import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
# y = 2 * x + 1 + noise
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print final weights
final_weights = model.get_weights()
print("Training finished.")
print(f"Learned weight (slope): {final_weights[0][0][0]:.4f}")
print(f"Learned bias: {final_weights[1][0]:.4f}")

# Example prediction
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"Prediction for input {sample_input[0][0]}: {prediction[0][0]:.4f}")