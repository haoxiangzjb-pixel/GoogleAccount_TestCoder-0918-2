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
    # Create an instance of the model with 10 input features
    model = BinaryClassifier(input_size=10)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example input tensor (batch_size=5, input_size=10)
    example_input = torch.randn(5, 10)
    
    # Forward pass
    output = model(example_input)
    print(f"\nExample output shape: {output.shape}")
    print(f"Example output: {output.flatten()}")
    
    # Save the model to a randomly named file
    random_filename = create_random_filename()
    
    # Write the current script to the random filename
    import inspect
    current_code = inspect.getsource(BinaryClassifier) + "\n\n" + inspect.getsource(create_random_filename)
    
    with open(random_filename, 'w') as f:
        f.write('# Binary Classification Model\n')
        f.write('import torch\n')
        f.write('import torch.nn as nn\n')
        f.write('import torch.nn.functional as F\n')
        f.write('import random\n')
        f.write('import string\n\n')
        f.write(inspect.getsource(BinaryClassifier))
        f.write('\n\n')
        f.write(inspect.getsource(create_random_filename))
        f.write('\n\n# Example usage:\nif __name__ == "__main__":')
        f.write('\n    # Create an instance of the model with 10 input features')
        f.write('\n    model = BinaryClassifier(input_size=10)')
        f.write('\n    \n    # Print the model architecture')
        f.write('\n    print("Model Architecture:")')
        f.write('\n    print(model)')
        f.write('\n    \n    # Example input tensor (batch_size=5, input_size=10)')
        f.write('\n    example_input = torch.randn(5, 10)')
        f.write('\n    \n    # Forward pass')
        f.write('\n    output = model(example_input)')
        f.write('\n    print(f"\\nExample output shape: {output.shape}")')
        f.write('\n    print(f"Example output: {output.flatten()}")')
    
    print(f"\nModel code saved to: {random_filename}")