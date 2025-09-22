import sqlite3
import random
import string

def generate_random_name(length=8):
    """Generate a random name for the database file"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def create_table():
    # Generate a random database name
    db_name = generate_random_name()
    conn = sqlite3.connect(f'{db_name}.db')
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            age INTEGER
        )
    ''')
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_name}.db' created with table 'users'")

if __name__ == "__main__":
    create_table()