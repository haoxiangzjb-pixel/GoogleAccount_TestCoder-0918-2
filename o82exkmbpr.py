import tensorflow as tf
import numpy as np
import random
import string

# Generate random data for demonstration
def generate_sample_data():
    # Create random input data
    X = np.random.randn(100, 1).astype(np.float32)
    # Create output data with a known linear relationship plus noise
    y = 2.5 * X + 1.0 + 0.1 * np.random.randn(100, 1).astype(np.float32)
    return X, y

# Generate the sample data
X_train, y_train = generate_sample_data()

# Build a simple linear regression model using TensorFlow/Keras
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,), activation='linear')
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X_train, y_train, epochs=100, verbose=0)

# Print final loss
print(f"Final training loss: {history.history['loss'][-1]:.4f}")

# Test the model with a new sample
test_input = np.array([[1.5]], dtype=np.float32)
prediction = model.predict(test_input)
print(f"Prediction for input {test_input[0][0]}: {prediction[0][0]:.4f}")

# Print the learned parameters (weights and bias)
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")