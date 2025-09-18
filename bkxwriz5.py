
import pandas as pd

# Recreate the filtered DataFrame
df = pd.DataFrame({
    'name': ['Bob', 'Diana'],
    'department': ['IT', 'IT'],
    'salary': [80000, 90000],
    'experience': [5, 7]
})

print("Filtered DataFrame (salary > 75000):")
print(df)

# Additional analysis on filtered data
avg_experience = df['experience'].mean()
print(f"\nAverage experience of high earners: {avg_experience:.1f} years")
