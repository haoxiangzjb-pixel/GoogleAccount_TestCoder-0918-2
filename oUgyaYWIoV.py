import tensorflow as tf
from tensorflow import keras

# Create a Keras model with exactly one dense layer
model = keras.Sequential([
    keras.layers.Dense(32, activation='relu', input_shape=(10,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='mse',
              metrics=['mae'])

# Display model summary
model.summary()

print("Model with one dense layer created successfully!")