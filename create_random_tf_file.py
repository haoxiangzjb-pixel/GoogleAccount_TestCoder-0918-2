import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

print(f"Creating random TensorFlow file: {random_name}")

# Create the TensorFlow source code content
tf_source_code = '''import tensorflow as tf
import numpy as np

# Simple linear regression model
def create_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Generate sample data
X = np.random.rand(50, 1).astype(np.float32)
y = 3 * X.flatten() + 2 + np.random.normal(0, 0.1, size=50).astype(np.float32)

# Create and train model
model = create_model()
model.fit(X, y, epochs=10, verbose=0)

# Make a prediction
test_val = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(test_val, verbose=0)
print(f"Prediction for input 0.5: {prediction[0][0]}")

print("Linear regression model completed successfully!")
'''

# Write the TensorFlow code to the randomly named file
with open(random_name, 'w') as f:
    f.write(tf_source_code)

print(f"Random TensorFlow file created: {random_name}")

# Verify the file exists
if os.path.exists(random_name):
    print("Success! Random file with TensorFlow code has been created.")
    print(f"File location: /workspace/{random_name}")
    print(f"File size: {os.path.getsize(random_name)} bytes")
else:
    print("Error: File was not created")