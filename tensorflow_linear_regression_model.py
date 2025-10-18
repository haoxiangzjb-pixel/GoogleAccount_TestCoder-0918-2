import tensorflow as tf
import numpy as np
import random
import string

# Generate random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Define the linear regression model
def create_linear_regression_model():
    # Create a simple model: y = wx + b
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(optimizer='sgd',  # stochastic gradient descent
                  loss='mean_squared_error',
                  metrics=['mae'])  # mean absolute error
    
    return model

# Generate some sample data
X_train = np.random.rand(100, 1).astype(np.float32)  # 100 samples, 1 feature
y_train = 3.5 * X_train.flatten() + 2.0 + np.random.normal(0, 0.1, size=100).astype(np.float32)  # y = 3.5x + 2 + noise

# Create and train the model
model = create_linear_regression_model()

print("Training the model...")
model.fit(X_train, y_train, epochs=50, verbose=0)

# Print model summary
print("\nModel Summary:")
model.summary()

# Test the model
X_test = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(X_test)
print(f"\nTest predictions for {X_test.flatten()}: {predictions.flatten()}")

# Save the trained model in SavedModel format
model.save('linear_regression_model')

print("\nModel saved in SavedModel format as 'linear_regression_model'")

# Also create the source script with a random name
source_code = '''
import tensorflow as tf
import numpy as np

# Define the linear regression model
def create_linear_regression_model():
    # Create a simple model: y = wx + b
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=(1,))
    ])
    
    # Compile the model
    model.compile(optimizer='sgd',
                  loss='mean_squared_error',
                  metrics=['mae'])
    
    return model

# Generate some sample data
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 3.5 * X_train.flatten() + 2.0 + np.random.normal(0, 0.1, size=100).astype(np.float32)

# Create and train the model
model = create_linear_regression_model()
print("Training the model...")
model.fit(X_train, y_train, epochs=50, verbose=0)

# Print model summary
print("Model Summary:")
model.summary()

# Test the model
X_test = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(X_test)
print(f"Test predictions for {X_test.flatten()}: {predictions.flatten()}")

# Save the trained model
model.save('linear_regression_model')
print("Model saved!")
'''

# Write the source code to the randomly named file
with open(random_name, 'w') as f:
    f.write(source_code)

print(f"Source code saved to: {random_name}")