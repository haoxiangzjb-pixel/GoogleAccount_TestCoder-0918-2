import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(8,))  # Input shape of 8, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Example of how to use the model
import numpy as np
# Generate dummy data for testing
x_test = np.random.random((5, 8))
predictions = model.predict(x_test)
print("Sample predictions shape:", predictions.shape)