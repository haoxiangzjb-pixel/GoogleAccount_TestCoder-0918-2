import sqlite3
import random
import string

def generate_random_name(length=8):
    """Generate a random name for the database file"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def create_table():
    # Generate a random database name
    db_name = generate_random_name() + ".db"
    
    # Connect to SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS employees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        department TEXT NOT NULL,
        salary REAL NOT NULL
    )
    ''')
    
    # Insert sample data
    sample_data = [
        ('John Doe', 'Engineering', 75000.0),
        ('Jane Smith', 'Marketing', 65000.0),
        ('Bob Johnson', 'Sales', 70000.0),
        ('Alice Williams', 'HR', 60000.0)
    ]
    
    cursor.executemany('''
    INSERT OR IGNORE INTO employees (name, department, salary)
    VALUES (?, ?, ?)
    ''', sample_data)
    
    # Commit changes and close connection
    conn.commit()
    conn.close()
    
    print(f"Database '{db_name}' created with 'employees' table and sample data.")

if __name__ == "__main__":
    create_table()