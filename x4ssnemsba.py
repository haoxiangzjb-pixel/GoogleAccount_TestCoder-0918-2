import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A neural network model for binary classification using PyTorch.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Batch normalization layers
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
    def forward(self, x):
        # First layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

def create_model(input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
    """
    Factory function to create a binary classifier model.
    
    Args:
        input_size (int): Number of input features
        hidden_size1 (int): Size of first hidden layer
        hidden_size2 (int): Size of second hidden layer
        dropout_rate (float): Dropout rate for regularization
    
    Returns:
        BinaryClassifier: The created model
    """
    return BinaryClassifier(
        input_size=input_size,
        hidden_size1=hidden_size1,
        hidden_size2=hidden_size2,
        dropout_rate=dropout_rate
    )

# Example usage
if __name__ == "__main__":
    # Create a model for binary classification with 10 input features
    model = create_model(input_size=10)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example forward pass with random input
    sample_input = torch.randn(5, 10)  # 5 samples with 10 features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save the model to a file
    torch.save(model.state_dict(), "binary_classifier_weights.pth")
    print("\nModel weights saved to 'binary_classifier_weights.pth'")
    
    # Create a new model instance and load the saved weights
    new_model = create_model(input_size=10)
    new_model.load_state_dict(torch.load("binary_classifier_weights.pth"))
    print("Model weights loaded successfully!")
