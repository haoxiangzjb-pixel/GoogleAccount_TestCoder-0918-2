import sqlite3
import random
import string

# Generate a random table name
def random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Function to create the table
def create_table():
    # Connect to SQLite database (or create it)
    conn = sqlite3.connect('example.db')
    cursor = conn.cursor()

    # Get a random table name
    table_name = random_table_name()
    print(f"Creating table: {table_name}")

    # Create a sample table with id, name, and age columns
    create_table_query = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER
    );
    '''
    cursor.execute(create_table_query)

    # Commit changes and close the connection
    conn.commit()
    conn.close()
    print(f"Table '{table_name}' created successfully.")

if __name__ == "__main__":
    create_table()