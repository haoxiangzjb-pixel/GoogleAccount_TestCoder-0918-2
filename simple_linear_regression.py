import tensorflow as tf
import numpy as np

# Generate small dataset for linear regression
np.random.seed(42)
X = np.random.randn(20, 1).astype(np.float32)  # Smaller dataset
y = 2 * X + 1 + 0.1 * np.random.randn(20, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='mean_squared_error',
              metrics=['mae'])

print("Model architecture:")
model.summary()

# Train the model with fewer epochs
print("Training the model...")
history = model.fit(X, y, epochs=5, verbose=1)  # Fewer epochs

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.2f}")
print(f"Learned bias: {bias[0]:.2f}")

# Make predictions
predictions = model.predict(X[:5])  # Predict on first 5 samples
print(f"Sample predictions: {predictions.flatten()[:5]}")
print(f"Actual values: {y.flatten()[:5]}")

# Print final loss
final_loss = history.history['loss'][-1]
print(f"Final loss: {final_loss:.4f}")

print("Model training completed successfully!")