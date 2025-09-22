import uuid
import os

# Generate a random filename
random_filename = f"keras_model_{uuid.uuid4().hex[:8]}.py"

# Save the model architecture to a Python file
model_code = '''import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
from tensorflow.keras.layers import Input

def create_model():
    """Create a Keras model with one dense layer."""
    # Using Input layer as recommended by the warning
    inputs = Input(shape=(5,))
    x = layers.Dense(10, activation='relu')(inputs)  # One dense layer
    outputs = layers.Dense(1, activation='sigmoid')(x)  # Output layer
    
    model = keras.Model(inputs=inputs, outputs=outputs)
    
    model.compile(optimizer='adam',
                  loss='binary_crossentropy',
                  metrics=['accuracy'])
    
    return model

if __name__ == "__main__":
    model = create_model()
    print("Model created successfully!")
    model.summary()
'''

# Write to the randomly named file
with open(random_filename, 'w') as f:
    f.write(model_code)

print(f"Keras model saved to {random_filename}")