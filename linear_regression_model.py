import tensorflow as tf
import numpy as np

# Generate some dummy data for training
num_samples = 1000
X_train = np.random.randn(num_samples, 1).astype(np.float32)
y_train = 2 * X_train.flatten() + 1 + 0.1 * np.random.randn(num_samples).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_train, y_train, epochs=100, verbose=0)

# Save the model
model.save('/workspace/trained_linear_model.h5')

print("Linear regression model built and saved successfully.")