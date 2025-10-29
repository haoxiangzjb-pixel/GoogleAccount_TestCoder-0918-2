import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Generate some sample data
np.random.seed(42)  # For reproducible random results
x = np.random.normal(50, 15, 100)
y = 2 * x + np.random.normal(0, 10, 100)

# Create a random filename
random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
plot_filename = f"scatter_plot_{random_string}.png"

# Create the scatter plot
plt.figure(figsize=(10, 8))
plt.scatter(x, y, alpha=0.6, c='blue')
plt.plot(np.unique(x), np.poly1d(np.polyfit(x, y, 1))(np.unique(x)), color='red', label='Trend line')
plt.title('Scatter Plot Example')
plt.xlabel('X Values')
plt.ylabel('Y Values')
plt.grid(True, linestyle='--', alpha=0.6)
plt.legend()

# Save the plot with the random filename
plt.savefig(plot_filename)
plt.close()

print(f"Scatter plot saved as: {plot_filename}")