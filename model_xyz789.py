import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,))  # Input shape of 10, 64 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='mean_squared_error',
              metrics=['mae'])

# Print model summary
model.summary()

# Example of how to use the model
import numpy as np
# Generate dummy data for testing
x_test = np.random.random((10, 10))
predictions = model.predict(x_test)
print("Sample predictions shape:", predictions.shape)