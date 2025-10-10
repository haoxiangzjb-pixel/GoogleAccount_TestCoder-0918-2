import random
import string

# Define the Scala case class content
scala_content = '''case class Point(x: Int, y: Int)
'''

# Generate a random filename with .scala extension
random_filename = "Point_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".scala"

# Write the content to the file
with open(random_filename, 'w') as f:
    f.write(scala_content)

print(f"Created Scala file: {random_filename}")