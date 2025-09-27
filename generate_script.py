import sqlite3
import random
import string

def generate_random_filename():
  letters = string.ascii_lowercase
  random_name = ''.join(random.choice(letters) for i in range(8))
  return f'{random_name}.py'

script_content = '''import sqlite3

# Connect to SQLite database (it will be created if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table
cursor.execute("""
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        age INTEGER
    )
""")

# Commit the changes and close the connection
conn.commit()
print("Table \'users\' created successfully!")
conn.close()
'''

# Generate a random filename
filename = generate_random_filename()

# Write the script content to the file
with open(filename, 'w') as f:
    f.write(script_content)

print(f'Script generated and saved as {filename}')