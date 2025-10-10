import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(1, input_shape=(1,))  # Single dense layer with 1 input and 1 output
])

# Print the model summary
model.summary()