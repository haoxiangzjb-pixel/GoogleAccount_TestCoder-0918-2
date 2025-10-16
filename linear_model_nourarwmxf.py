import tensorflow as tf
import numpy as np

# Simple linear regression model
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Build the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=50, verbose=0)

# Print model summary
print("Model Summary:")
model.summary()

# Make a prediction
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"Prediction for input {sample_input[0][0]}: {prediction[0][0]}")