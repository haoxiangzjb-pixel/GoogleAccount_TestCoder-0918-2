import tensorflow as tf
import numpy as np

print("TensorFlow Linear Regression Model")
print("=" * 40)

# Generate sample data for linear regression (y = 2x + 1 + noise)
np.random.seed(42)
X_train = np.random.randn(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

print("Model architecture:")
model.summary()

# Train the model briefly
print("\nTraining the model...")
history = model.fit(X_train, y_train, epochs=10, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"Expected weight: 2.000, Expected bias: 1.000")

# Make predictions on a few samples
predictions = model.predict(X_train[:5])
print(f"\nSample predictions vs actual values:")
for i in range(5):
    print(f"  x={X_train[i][0]:.3f}, predicted y={predictions[i][0]:.3f}, actual y={y_train[i][0]:.3f}")

# Print final metrics
final_loss = history.history['loss'][-1]
final_mae = history.history['mae'][-1]
print(f"\nFinal loss: {final_loss:.4f}")
print(f"Final MAE: {final_mae:.4f}")
print("\nModel training completed successfully!")