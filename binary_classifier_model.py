import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification using PyTorch
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.bn1(self.fc1(x)))  # Apply ReLU activation and batch norm
        x = F.relu(self.bn2(self.dropout(self.fc2(x))))  # Apply ReLU, dropout, and batch norm
        x = torch.sigmoid(self.fc3(x))  # Sigmoid activation for binary classification
        return x

# Function to generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}_binary_classifier.py"

# Example usage
if __name__ == "__main__":
    # Create a model instance (assuming input size of 10 features)
    input_size = 10
    model = BinaryClassifier(input_size)
    
    # Print model architecture
    print("Model Architecture:")
    print(model)
    
    # Generate a random input tensor to test the model
    test_input = torch.randn(5, input_size)  # 5 samples, input_size features each
    output = model(test_input)
    print(f"\nInput shape: {test_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (probabilities): {output.flatten()}")
    
    # Save the model definition to a randomly named file
    random_filename = generate_random_filename()
    print(f"\nSaving model code to: {random_filename}")
    
    # Read the current file and save it with the random name
    with open(__file__, 'r') as original_file:
        code_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(code_content)
    
    print(f"Model code successfully saved to {random_filename}")