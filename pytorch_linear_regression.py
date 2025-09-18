import torch
import torch.nn as nn
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X_np = np.random.randn(100, 1).astype(np.float32)
y_np = 2 * X_np + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

# Convert to PyTorch tensors
X = torch.from_numpy(X_np)
y = torch.from_numpy(y_np)

# Define linear regression model
class LinearRegressionModel(nn.Module):
    def __init__(self):
        super(LinearRegressionModel, self).__init__()
        self.linear = nn.Linear(1, 1)
        
    def forward(self, x):
        return self.linear(x)

# Create model instance
model = LinearRegressionModel()

# Define loss function and optimizer
criterion = nn.MSELoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)

# Train the model
num_epochs = 100
for epoch in range(num_epochs):
    # Forward pass
    y_pred = model(X)
    loss = criterion(y_pred, y)
    
    # Backward pass and optimization
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
    
    if (epoch+1) % 20 == 0:
        print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {loss.item():.4f}')

# Evaluate the model
model.eval()
with torch.no_grad():
    predictions = model(X[:5])
    print(f"Sample predictions: {predictions.flatten()}")
    print(f"Actual values: {y[:5].flatten()}")

# Save the model
torch.save(model.state_dict(), 'linear_regression_model.pth')
print("Model saved as 'linear_regression_model.pth'")

# Plot results
plt.scatter(X_np, y_np, label='Data')
with torch.no_grad():
    y_predicted = model(X).numpy()
plt.plot(X_np, y_predicted, color='red', label='Prediction')
plt.legend()
plt.title('Linear Regression with PyTorch')
plt.show()