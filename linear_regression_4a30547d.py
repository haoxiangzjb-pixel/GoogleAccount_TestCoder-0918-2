import tensorflow as tf
import numpy as np

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error'
)

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Model loss: {loss}")

# Make predictions
predictions = model.predict([0.0, 1.0, 2.0])
print(f"Predictions for [0.0, 1.0, 2.0]: {predictions.flatten()}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")