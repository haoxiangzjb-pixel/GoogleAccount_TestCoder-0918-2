import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential()

# Add one dense layer with 10 units and ReLU activation
# Input shape is set to 5 features for this example
model.add(layers.Dense(10, activation='relu', input_shape=(5,)))

# Compile the model
model.compile(optimizer='adam',
              loss='mse',
              metrics=['mae'])

# Print model summary
model.summary()

# Save the model
# model.save('my_model.h5')  # Uncomment to save the model weights