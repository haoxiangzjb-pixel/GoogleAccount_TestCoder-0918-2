import pandas as pd
import random
import string

def generate_random_filename(length=8, prefix="filtered_data_", suffix=".py"):
    """Generates a random filename."""
    random_chars = ''.join(random.choice(string.ascii_lowercase + string.digits) for _ in range(length))
    return f"{prefix}{random_chars}{suffix}"

def create_and_save_filtered_data():
    # Create a sample DataFrame
    data = {
        'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
        'Age': [25, 30, 35, 28, 22],
        'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
    }
    df = pd.DataFrame(data)

    # Filter the DataFrame (e.g., Age > 25)
    filtered_df = df[df['Age'] > 25]

    # Generate a random filename
    filename = generate_random_filename()

    # Save the filtered DataFrame to the randomly named .py file
    # This example saves it as a string representation of the DataFrame
    with open(filename, 'w') as f:
        f.write("# Filtered DataFrame\n")
        f.write("import pandas as pd\n\n")
        f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
        f.write("df = pd.DataFrame(filtered_data)\n")

    print(f"Filtered DataFrame saved to {filename}")

if __name__ == "__main__":
    create_and_save_filtered_data()
