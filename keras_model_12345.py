import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),  # Example: 784 input units, 10 output units with ReLU activation
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Save the model (optional)
# model.save('my_model.keras')