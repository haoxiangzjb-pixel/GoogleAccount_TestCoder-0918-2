import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        # Input layer to hidden layer
        self.fc1 = nn.Linear(input_size, hidden_size)
        # Hidden layer to another hidden layer
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        # Hidden layer to output
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Apply ReLU activation function to first layer
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        # Apply ReLU activation function to second layer
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        return x

def create_model(input_size, hidden_size=64):
    """
    Function to create and return a binary classifier model
    """
    model = BinaryClassifier(input_size, hidden_size)
    return model

# Example usage
if __name__ == "__main__":
    # Create a model with 10 input features
    input_size = 10
    model = create_model(input_size)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Create a sample input tensor
    sample_input = torch.randn(1, input_size)
    print(f"\nSample input shape: {sample_input.shape}")
    
    # Forward pass
    output = model(sample_input)
    print(f"Output: {output.item():.4f} (probability)")
    print(f"Prediction: {'Class 1' if output.item() > 0.5 else 'Class 0'}")
    
    # Count parameters
    total_params = sum(p.numel() for p in model.parameters())
    trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f"\nTotal parameters: {total_params}")
    print(f"Trainable parameters: {trainable_params}")