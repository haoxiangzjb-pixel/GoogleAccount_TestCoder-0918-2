import torch
import torch.nn as nn


class BinaryClassifier(nn.Module):
    """A simple neural network for binary classification."""

    def __init__(self, input_size: int, hidden_size: int = 64):
        super(BinaryClassifier, self).__init__()
        self.network = nn.Sequential(
            nn.Linear(input_size, hidden_size),
            nn.ReLU(),
            nn.Linear(hidden_size, hidden_size // 2),
            nn.ReLU(),
            nn.Linear(hidden_size // 2, 1),
            nn.Sigmoid()
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        return self.network(x)


if __name__ == "__main__":
    # Example usage
    input_features = 10
    model = BinaryClassifier(input_size=input_features)
    
    # Create a dummy input batch
    dummy_input = torch.randn(32, input_features)
    output = model(dummy_input)
    
    print(f"Model architecture:\n{model}")
    print(f"Input shape: {dummy_input.shape}")
    print(f"Output shape: {output.shape}")
