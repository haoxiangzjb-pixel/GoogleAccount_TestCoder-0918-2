import pandas as pd
import random
import string
import os

def generate_random_filename(length=8):
    """Generate a random filename with .py extension"""
    chars = string.ascii_lowercase + string.digits
    return ''.join(random.choice(chars) for _ in range(length)) + '.py'

# Create sample DataFrame
df = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'],
    'department': ['HR', 'IT', 'Finance', 'IT', 'HR'],
    'salary': [65000, 80000, 75000, 90000, 70000],
    'experience': [2, 5, 3, 7, 4]
})

print("Original DataFrame:")
print(df)

# Filter DataFrame (employees with salary > 75000)
high_earners = df[df['salary'] > 75000]

print("\nFiltered DataFrame (salary > 75000):")
print(high_earners)

# Create the script content as a multi-line string
script_content = '''import pandas as pd

# Recreate the filtered DataFrame
data = {
    'name': ['Bob', 'Diana'],
    'department': ['IT', 'IT'],
    'salary': [80000, 90000],
    'experience': [5, 7]
}
df = pd.DataFrame(data)

print("Filtered DataFrame (salary > 75000):")
print(df)

# Additional analysis on filtered data
avg_experience = df['experience'].mean()
print(f"\\nAverage experience of high earners: {avg_experience:.1f} years")
'''

# Generate random filename
random_filename = generate_random_filename()
print(f"\nSaving filtered data script to: {random_filename}")

# Save script to random filename
with open(random_filename, 'w') as f:
    f.write(script_content)

print("Script saved successfully!")
print("\nTo run the generated script:")
print(f"python {random_filename}")