import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to SQLite database (or create it)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create a table with a random name
table_name = random_table_name()
create_table_query = f'''
CREATE TABLE IF NOT EXISTS "{table_name}" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    value REAL
);
'''
cursor.execute(create_table_query)

# Commit changes and close the connection
conn.commit()
conn.close()

print(f"Table '{table_name}' created successfully in 'example.db'.")