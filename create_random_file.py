import random
import string

# Define the content to be saved (representation of the Scala case class)
point_content = "Point(1.0, 2.5)"

# Generate a random string for the filename
random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
file_name = f"point_{random_string}.txt"

# Write the content to the randomly named file
with open(file_name, 'w') as f:
    f.write(point_content)

print(f"Point saved to {file_name}")