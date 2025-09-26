import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np

# Define the neural network model for binary classification
class BinaryClassifier(nn.Module):
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, 128)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.2)
        self.fc2 = nn.Linear(128, 64)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(0.2)
        self.fc3 = nn.Linear(64, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu1(x)
        x = self.dropout1(x)
        x = self.fc2(x)
        x = self.relu2(x)
        x = self.dropout2(x)
        x = self.fc3(x)
        x = self.sigmoid(x)
        return x

# Example usage
if __name__ == "__main__":
    # Example: Input size of 10 features
    input_size = 10
    model = BinaryClassifier(input_size)

    # Example: Create a dummy input batch of size (5, 10)
    dummy_input = torch.randn(5, input_size)

    # Forward pass
    output = model(dummy_input)
    print(f"Model output shape: {output.shape}")  # Should be [5, 1]
    print(f"Model output (probabilities): {output.flatten()}")

    # Save the model's state dictionary
    torch.save(model.state_dict(), "binary_classifier_model.pth")
    print("Model state dictionary saved to 'binary_classifier_model.pth'")

    # Example of how to load the model
    loaded_model = BinaryClassifier(input_size)
    loaded_model.load_state_dict(torch.load("binary_classifier_model.pth"))
    loaded_model.eval()
    print("Model loaded successfully.")