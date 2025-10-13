import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print the model summary
model.summary()

# Save the model (optional, if you want to save it for later use)
# model.save('my_model.keras')