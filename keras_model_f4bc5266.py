import tensorflow as tf
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
