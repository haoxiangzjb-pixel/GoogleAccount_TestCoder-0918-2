import sqlite3
import random
import string
import os

def generate_sqlite_script():
    # Generate a random filename
    random_filename = 'script_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

    # Python script content to create a SQLite table
    script_content = '''import sqlite3

# Connect to SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table
cursor.execute(\"\"\"CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
)\"\"\")

# Commit changes and close the connection
conn.commit()
conn.close()
print('Table \\\'users\\\' created successfully in example.db')
'''

    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Generated script saved as: {random_filename}")
    return random_filename

if __name__ == "__main__":
    generate_sqlite_script()
