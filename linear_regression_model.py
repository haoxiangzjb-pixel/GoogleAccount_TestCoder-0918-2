import tensorflow as tf
import numpy as np
import random
import string

# Generate random data for demonstration
def generate_data(num_samples=100):
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # Linear relationship: y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Build the model
def build_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(1, input_shape=(1,))
    ])
    
    model.compile(
        optimizer='adam',
        loss='mean_squared_error',
        metrics=['mae']
    )
    
    return model

# Main execution
if __name__ == "__main__":
    # Generate data
    X_train, y_train = generate_data(1000)
    X_test, y_test = generate_data(200)
    
    # Build the model
    model = build_model()
    
    print("Model architecture:")
    model.summary()
    
    # Train the model
    print("\nTraining the model...")
    history = model.fit(
        X_train, y_train,
        epochs=50,
        batch_size=32,
        validation_split=0.2,
        verbose=1
    )
    
    # Evaluate the model
    print("\nEvaluating the model...")
    test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
    print(f"Test Loss (MSE): {test_loss:.4f}")
    print(f"Test MAE: {test_mae:.4f}")
    
    # Make predictions
    sample_predictions = model.predict(X_test[:5])
    print("\nSample predictions vs actual values:")
    for i in range(5):
        print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")
    
    # Save the model
    model_name = 'linear_regression_model.h5'
    model.save(model_name)
    print(f"\nModel saved as {model_name}")
    
    # Generate a random filename for this script
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    print(f"This script would be saved with a random name like: {random_filename}")