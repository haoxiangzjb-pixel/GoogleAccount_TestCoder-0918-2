import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input units, 10 output units
])

# Compile the model (optional for just saving the architecture)
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')

# Save the model (architecture, weights, and optimizer state)
model.save('my_model.keras')

print("Model created and saved as 'my_model.keras'")