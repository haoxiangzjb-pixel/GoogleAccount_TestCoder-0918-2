import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons in dense layer
])

# Display model summary
model.summary()

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Example of how to use the model with dummy data
dummy_input = np.random.random((100, 5))  # 100 samples, 5 features each
dummy_output = np.random.randint(0, 10, (100,))  # Random labels from 0 to 9

print("Model created successfully!")
print(f"Model input shape: {model.input_shape}")
print(f"Model output shape: {model.output_shape}")