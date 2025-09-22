import sqlite3
import random
import string

def generate_random_name(length=8):
    """Generate a random string of letters and digits"""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def create_database_and_table():
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
        salary REAL NOT NULL,
        hire_date TEXT NOT NULL
    )
    ''')
    
    # Insert sample data
    sample_data = [
        ("John Smith", "Engineering", 75000.0, "2022-01-15"),
        ("Jane Doe", "Marketing", 65000.0, "2021-06-30"),
        ("Robert Johnson", "Sales", 70000.0, "2023-03-10"),
        ("Emily Williams", "HR", 60000.0, "2020-11-05")
    ]
    
    cursor.executemany('''
    INSERT OR IGNORE INTO employees (name, department, salary, hire_date)
    VALUES (?, ?, ?, ?)
    ''', sample_data)
    
    # Commit changes and close connection
    conn.commit()
    print(f"Database '{db_name}' created successfully with 'employees' table")
    print("Sample data inserted:")
    
    # Display the inserted data
    cursor.execute("SELECT * FROM employees")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    
    conn.close()

if __name__ == "__main__":
    create_database_and_table()