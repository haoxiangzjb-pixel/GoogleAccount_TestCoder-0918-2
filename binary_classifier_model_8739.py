import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A neural network model for binary classification using PyTorch.
    This model consists of an input layer, two hidden layers, and an output layer.
    """
    
    def __init__(self, input_size):
        """
        Initialize the neural network layers.
        
        Args:
            input_size (int): Number of input features
        """
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, 128)  # First hidden layer
        self.fc2 = nn.Linear(128, 64)          # Second hidden layer
        self.fc3 = nn.Linear(64, 32)           # Third hidden layer
        self.fc4 = nn.Linear(32, 1)            # Output layer (single output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(128)
        self.bn2 = nn.BatchNorm1d(64)
        self.bn3 = nn.BatchNorm1d(32)
    
    def forward(self, x):
        """
        Forward pass through the network.
        
        Args:
            x (torch.Tensor): Input tensor of shape (batch_size, input_size)
        
        Returns:
            torch.Tensor: Output tensor of shape (batch_size, 1) with sigmoid activation
        """
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Third hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn3(self.fc3(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc4(x))
        
        return x

def create_model(input_size):
    """
    Helper function to create an instance of the BinaryClassifier model.
    
    Args:
        input_size (int): Number of input features
    
    Returns:
        BinaryClassifier: An instance of the binary classifier model
    """
    return BinaryClassifier(input_size)

# Example usage
if __name__ == "__main__":
    # Example: Create a model for a dataset with 10 features
    model = create_model(input_size=10)
    
    # Example input tensor (batch_size=5, input_size=10)
    example_input = torch.randn(5, 10)
    
    # Forward pass
    output = model(example_input)
    
    print(f"Model created successfully!")
    print(f"Input shape: {example_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (first 3 samples): {output[:3].flatten()}")
    
    # Print model architecture
    print("\nModel Architecture:")
    print(model)