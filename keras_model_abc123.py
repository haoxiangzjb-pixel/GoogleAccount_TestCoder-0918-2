import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define the model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(4,))  # Example: 4 input features, 10 neurons in the dense layer
])

# Compile the model (optional, but common)
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Print model summary
model.summary()

# Save the model (optional)
model.save('my_model.h5')

# To save the model creation code to a Python file, you would typically run this script.
# The script itself is the "model definition file".
# If you need to save the *architecture only* as Python code, you could do:
config = model.get_config()
with open('model_architecture_config.py', 'w') as f:
    f.write(f"model_config = {config}\n")
print("Model architecture config saved to 'model_architecture_config.py'")
