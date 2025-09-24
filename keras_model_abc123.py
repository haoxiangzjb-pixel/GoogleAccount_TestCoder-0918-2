import tensorflow as tf

# Create a simple Sequential model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(10, activation='relu', input_shape=(784,)),  # Example: 784 input features, 10 units in the dense layer
    # Add more layers here if needed
])

# Compile the model (optional for just saving the structure)
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Save the model structure to a Python file
model.save('my_model.h5')  # Saves the entire model (structure + weights) in HDF5 format

print("Model created and saved as my_model.h5")