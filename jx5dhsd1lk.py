import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # 5 input features, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='mse',
              metrics=['mae'])

# Print model summary
model.summary()

# Example of how to use the model
# Generate dummy data
x_test = np.random.random((1, 5))
predictions = model.predict(x_test)
print("Sample prediction:", predictions)

# Save the model if needed
# model.save('my_model.h5')