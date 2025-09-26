#!/usr/bin/env python3
"""
This script generates another Python script that contains a filtered Pandas DataFrame.
"""

import pandas as pd
import random
import string
import os

def generate_filtered_script():
    # Create the original DataFrame
    df = pd.DataFrame({
        'A': [1, 2, 3, 8, 5],
        'B': ['x', 'y', 'z', 'x', 'y'],
        'C': [10, 20, 30, 40, 50]
    })

    # Filter the DataFrame
    filtered_df = df[df['A'] > 3]

    # Generate a random filename
    random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

    # Write the new script content
    script_content = f"""import pandas as pd

# Filtered DataFrame
filtered_data = pd.DataFrame({filtered_df.to_dict()})

print(filtered_data)
"""

    # Save the script
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Script containing the filtered DataFrame saved as {random_filename}")
    return random_filename

if __name__ == "__main__":
    generate_filtered_script()
