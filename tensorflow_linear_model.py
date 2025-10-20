import tensorflow as tf
import numpy as np

print("TensorFlow version:", tf.__version__)

# Create a simple model without training
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,), name='linear_layer')
])

# Show the model
model.build(input_shape=(None, 1))
model.summary()

# Test the untrained model with a simple prediction
test_input = tf.constant([[1.0], [2.0]])
prediction = model(test_input)
print("Untrained model predictions:", prediction.numpy().flatten())

print("Model created successfully!")
print("This is a simple linear regression model built with TensorFlow.")