import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Connect to a SQLite database (or create it)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Get a random table name
table_name = random_table_name()

# Create a table with the random name
create_table_sql = f'''
CREATE TABLE {table_name} (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    value REAL
);
'''

cursor.execute(create_table_sql)
print(f"Table '{table_name}' created successfully.")

# Commit changes and close the connection
conn.commit()
conn.close()
