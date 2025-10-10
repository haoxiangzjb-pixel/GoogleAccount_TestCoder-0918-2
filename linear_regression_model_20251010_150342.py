import tensorflow as tf
import numpy as np

# Generate dummy data for demonstration
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weights = 2.5
true_bias = 0.5
y = X * true_weights + true_bias + np.random.randn(num_samples, 1).astype(np.float32) * 0.1

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print final weights and bias
final_weights, final_bias = model.layers[0].get_weights()
print(f"Learned weight: {float(final_weights[0][0]):.4f}, True weight: {true_weights:.4f}")
print(f"Learned bias: {float(final_bias[0]):.4f}, True bias: {true_bias:.4f}")

# Save the model
model.save('/workspace/trained_linear_model.h5')
print("Model saved as 'trained_linear_model.h5'")