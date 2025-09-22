import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1, hidden_size2):
        super(BinaryClassifier, self).__init__()
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        
        # Dropout layer for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

# Example usage:
# model = BinaryClassifier(input_size=20, hidden_size1=16, hidden_size2=8)
# input_data = torch.randn(32, 20)  # Batch of 32 samples with 20 features
# output = model(input_data)
# print(output.shape)  # Should be [32, 1]

if __name__ == "__main__":
    # Create a model instance for testing
    model = BinaryClassifier(input_size=20, hidden_size1=16, hidden_size2=8)
    print(f"Model architecture:\n{model}")
    
    # Test with sample data
    input_data = torch.randn(32, 20)
    output = model(input_data)
    print(f"\nInput shape: {input_data.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output range: [{output.min().item():.4f}, {output.max().item():.4f}]")