import tensorflow as tf
import numpy as np

print("TensorFlow version:", tf.__version__)

# Create minimal dataset
X = np.array([[1.0], [2.0], [3.0], [4.0]], dtype=np.float32)
y = np.array([[3.0], [5.0], [7.0], [9.0]], dtype=np.float32)  # y = 2*x + 1

# Create a simple model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile
model.compile(optimizer='sgd', loss='mean_squared_error')

print("Model built successfully!")
print("Training on minimal dataset...")

# Train for just 1 epoch
model.fit(X, y, epochs=1, verbose=0)

print("Training completed!")
print("Model prediction for x=5:", float(model.predict(np.array([[5.0]]), verbose=0)[0][0]))