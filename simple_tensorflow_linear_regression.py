import tensorflow as tf
import numpy as np
import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=12)) + '.py'

print(f"Creating TensorFlow linear regression model...")
print(f"Random filename generated: {random_name}")

# Define the linear regression model
def create_linear_regression_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    # Use a simple optimizer that's more compatible
    model.compile(
        optimizer=tf.keras.optimizers.SGD(learning_rate=0.1),
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Generate sample data: y = 2x + 1 + noise
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train.flatten() + 1 + np.random.normal(0, 0.1, size=100).astype(np.float32)

# Create and train the model
model = create_linear_regression_model()

print("Training the model...")
model.fit(X_train, y_train, epochs=20, verbose=1)

# Print model summary
print("\nModel Summary:")
model.summary()

# Test the model
X_test = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(X_test, verbose=0)
print(f"\nTest predictions for inputs {X_test.flatten()}: {predictions.flatten()}")

# Save the trained model
model.save('linear_regression_model')
print("\nModel saved in SavedModel format as 'linear_regression_model'")

# Create the source code for the randomly named file
source_code = '''import tensorflow as tf
import numpy as np

# Simple linear regression model
def create_linear_regression_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    model.compile(
        optimizer=tf.keras.optimizers.SGD(learning_rate=0.1),
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Generate sample data
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train.flatten() + 1 + np.random.normal(0, 0.1, size=100).astype(np.float32)

# Create and train the model
model = create_linear_regression_model()
model.fit(X_train, y_train, epochs=20, verbose=0)

# Test the model
X_test = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(X_test, verbose=0)
print(f"Test predictions: {predictions.flatten()}")

# Save the model
model.save('trained_linear_model')
print("Linear regression model saved!")
'''

# Write the source code to the randomly named file
with open(random_name, 'w') as f:
    f.write(source_code)

print(f"Source code saved to: {random_name}")

# Verify the file was created
if os.path.exists(random_name):
    print(f"Successfully created file: {random_name}")
    print(f"File size: {os.path.getsize(random_name)} bytes")
else:
    print(f"Error: File {random_name} was not created")