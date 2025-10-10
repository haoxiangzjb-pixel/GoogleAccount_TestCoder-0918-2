import sqlite3
import random
import string

# Generate a random table name
def generate_random_table_name():
    return 'table_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))

# Function to create the table
def create_table(db_name='example.db'):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()
    
    table_name = generate_random_table_name()
    
    create_table_sql = f'''
    CREATE TABLE IF NOT EXISTS {table_name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER,
        email TEXT UNIQUE
    );
    '''
    
    cursor.execute(create_table_sql)
    conn.commit()
    print(f"Table '{table_name}' created successfully in {db_name}")
    conn.close()

if __name__ == "__main__":
    create_table()