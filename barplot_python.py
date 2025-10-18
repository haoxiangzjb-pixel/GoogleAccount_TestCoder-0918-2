import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Create sample data
categories = ['A', 'B', 'C', 'D', 'E']
values = [23, 45, 56, 78, 32]

# Create the bar plot
fig, ax = plt.subplots(figsize=(10, 6))
bars = ax.bar(categories, values, color='steelblue', edgecolor='black')

# Add title and labels
ax.set_title('Sample Bar Plot', fontsize=16)
ax.set_xlabel('Categories', fontsize=12)
ax.set_ylabel('Values', fontsize=12)

# Add value labels on top of bars
for bar, value in zip(bars, values):
    height = bar.get_height()
    ax.text(bar.get_x() + bar.get_width()/2., height + 1,
            f'{value}', ha='center', va='bottom')

# Adjust layout to prevent label cutoff
plt.tight_layout()

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
filename = f"barplot_{random_name}.png"

# Save the plot
plt.savefig(filename)
print(f"Bar plot saved as {filename}")

# Show the plot (optional)
# plt.show()