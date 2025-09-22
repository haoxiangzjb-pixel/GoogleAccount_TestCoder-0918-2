import tensorflow as tf
import numpy as np

# Generate sample data
np.random.seed(42)
X = np.random.randn(10, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(10, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error'
)

print("Model created and compiled successfully!")

# Just train for 1 epoch with verbose=0 to avoid timing issues
model.fit(X, y, epochs=1, verbose=0)

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Model loss: {loss}")

# Save the model
model.save('minimal_linear_regression_model.h5')
print("Model saved as 'minimal_linear_regression_model.h5'")