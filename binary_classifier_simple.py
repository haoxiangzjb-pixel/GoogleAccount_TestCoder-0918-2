import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

def create_random_filename():
    """Generate a random filename for the model script."""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"/workspace/{random_name}_binary_classifier.py"

# Example usage:
if __name__ == "__main__":
    # Set device to CPU to avoid CUDA issues
    device = torch.device("cpu")
    
    # Create an instance of the model with 10 input features
    model = BinaryClassifier(input_size=10)
    model.to(device)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example input tensor (batch_size=5, input_size=10)
    example_input = torch.randn(5, 10).to(device)
    
    # Forward pass
    output = model(example_input)
    print(f"\nExample output shape: {output.shape}")
    print(f"Example output: {output.flatten()}")
    
    # Generate a random filename and save the model class definition to that file
    random_filename = create_random_filename()
    
    # Create the content for the new file
    file_content = '''import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)

    def forward(self, x):
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage:
if __name__ == "__main__":
    # Create an instance of the model with 10 input features
    model = BinaryClassifier(input_size=10)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example input tensor (batch_size=5, input_size=10)
    example_input = torch.randn(5, 10)
    
    # Forward pass
    output = model(example_input)
    print(f"\\nExample output shape: {output.shape}")
    print(f"Example output: {output.flatten()}")
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(file_content)
    
    print(f"\nModel code saved to: {random_filename}")