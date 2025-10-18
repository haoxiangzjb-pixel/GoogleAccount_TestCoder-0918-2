import tensorflow as tf
import numpy as np
import random
import string

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
print(f"Random filename: {random_name}")

# Create a very basic linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model with a more basic optimizer
model.compile(
    optimizer='adam',
    loss='mean_squared_error'
)

# Generate simple training data
x_train = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], dtype=float)
y_train = np.array([2, 4, 6, 8, 10, 12, 14, 16, 18, 20], dtype=float)  # y = 2x

# Train the model briefly
print("Training model...")
model.fit(x_train, y_train, epochs=5, verbose=0)

# Test the model
test_input = np.array([11.0], dtype=float)
prediction = model.predict(test_input, verbose=0)
print(f"Test prediction for input {test_input[0]}: {prediction[0][0]}")

# Save the model
model.save('basic_linear_model')
print("Model saved!")

# Create source code for the random file
source_code = f'''import tensorflow as tf
import numpy as np

# Basic linear regression model
model = tf.keras.Sequential([tf.keras.layers.Dense(units=1, input_shape=(1,))])
model.compile(optimizer='adam', loss='mean_squared_error')

# Simple training data
x_train = np.array([1, 2, 3, 4, 5], dtype=float)
y_train = np.array([2, 4, 6, 8, 10], dtype=float)  # y = 2x

# Train briefly
model.fit(x_train, y_train, epochs=3, verbose=0)

# Example prediction
test_input = np.array([6.0], dtype=float)
prediction = model.predict(test_input, verbose=0)
print(f"Prediction for input {{test_input[0]}}: {{prediction[0][0]}}")

# Save model
model.save('example_model')
'''

# Write the source code to the randomly named file
with open(random_name, 'w') as f:
    f.write(source_code)

print(f"Source code saved to: {random_name}")

# Verify file exists
import os
if os.path.exists(random_name):
    print("Random file successfully created!")
    print(f"File path: {random_name}")
else:
    print("Error creating random file")