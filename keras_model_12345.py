import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input units, 10 output units with ReLU
])

# Print the model summary
model.summary()