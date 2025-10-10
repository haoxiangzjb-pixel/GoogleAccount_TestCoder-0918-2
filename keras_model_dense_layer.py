import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential()

# Add a Dense layer with 10 units and ReLU activation
model.add(layers.Dense(10, activation='relu', input_shape=(784,)))

# Print the model summary
model.summary()

# Save the model architecture (not weights) to a JSON file as an example
# model_json = model.to_json()
# with open("model.json", "w") as json_file:
#     json_file.write(model_json)