import tensorflow as tf

# Create a simple Sequential model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(10, activation='relu', input_shape=(4,))  # Example: 4 input features, 10 neurons in the dense layer
])

# Compile the model
model.compile(optimizer='adam', loss='mse')

# Print the model summary
model.summary()

# Save the model architecture and weights (optional)
model.save('simple_model.h5')