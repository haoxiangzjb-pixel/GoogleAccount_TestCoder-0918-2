import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Generate random filename
random_name = 'scatter_plot_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.png'

# Create sample data
x = np.random.randn(100)
y = 2 * x + np.random.randn(100)

# Create the scatter plot
plt.figure(figsize=(10, 6))
plt.scatter(x, y, alpha=0.6, color='blue')
plt.title('Scatter Plot: X vs Y')
plt.xlabel('X values')
plt.ylabel('Y values')

# Add a trend line
z = np.polyfit(x, y, 1)
p = np.poly1d(z)
plt.plot(x, p(x), "r--", alpha=0.8, label='Trend line')
plt.legend()

# Save the plot with the random filename
plt.savefig(random_name, dpi=300, bbox_inches='tight')
plt.show()

print(f"Scatter plot saved as: {random_name}")