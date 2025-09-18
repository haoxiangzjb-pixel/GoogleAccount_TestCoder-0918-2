import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
print(f"Generated filename: {filename}")

# Create the content for the new Python file
function_content = '''def hello_world():
    print('Привет, мир!')

# Call the function
hello_world()
'''

# Write the content to the new file
with open(filename, 'w', encoding='utf-8') as f:
    f.write(function_content)

print(f"File {filename} has been created with the hello_world function.")