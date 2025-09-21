import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassificationNet(nn.Module):
    """
    A simple neural network for binary classification tasks.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32):
        """
        Initialize the network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Number of neurons in the first hidden layer
            hidden_size2 (int): Number of neurons in the second hidden layer
        """
        super(BinaryClassificationNet, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        """
        Forward pass through the network.
        
        Args:
            x (Tensor): Input tensor of shape (batch_size, input_size)
            
        Returns:
            Tensor: Output tensor of shape (batch_size, 1) with logits
        """
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)
        return x
    
    def predict(self, x):
        """
        Make binary predictions (0 or 1) using sigmoid activation.
        
        Args:
            x (Tensor): Input tensor
            
        Returns:
            Tensor: Binary predictions (0 or 1)
        """
        with torch.no_grad():
            logits = self.forward(x)
            probabilities = torch.sigmoid(logits)
            return (probabilities > 0.5).float()

# Example usage (commented out to avoid execution issues):
# if __name__ == "__main__":
#     # Create a sample model
#     model = BinaryClassificationNet(input_size=10)
#     
#     # Create sample input data
#     sample_input = torch.randn(5, 10)  # 5 samples with 10 features each
#     
#     # Get model output (logits)
#     logits = model(sample_input)
#     print("Logits:", logits)
#     
#     # Get binary predictions
#     predictions = model.predict(sample_input)
#     print("Predictions:", predictions)