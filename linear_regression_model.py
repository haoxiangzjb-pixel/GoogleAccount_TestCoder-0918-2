import tensorflow as tf
import numpy as np

# Generate some synthetic data for demonstration
# y = 2*x + 1 + noise
np.random.seed(0)
x_train = np.random.rand(100, 1).astype(np.float32)
noise = np.random.normal(0, 0.1, size=x_train.shape).astype(np.float32)
y_train = 2 * x_train + 1 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error',
    metrics=['mean_absolute_error']
)

# Train the model
print("Training the model...")
model.fit(x_train, y_train, epochs=100, verbose=0)
print("Training complete.")

# Evaluate the model
loss, mae = model.evaluate(x_train, y_train, verbose=0)
print(f"Model Loss: {loss:.4f}")
print(f"Model MAE: {mae:.4f}")

# Make a prediction
test_input = np.array([[0.5]])
prediction = model.predict(test_input)
print(f"Prediction for input {test_input[0][0]}: {prediction[0][0]:.4f}")

# Save the model
model.save('linear_regression_tf_model.h5')
print("Model saved as 'linear_regression_tf_model.h5'")