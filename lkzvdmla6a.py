import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host (str): Database host
        database (str): Database name
        user (str): Username
        password (str): Password
        port (int): Port number (default 5432)
    
    Returns:
        connection: psycopg2 connection object
    """
    try:
        # Establish connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database!")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    # Example usage - replace these values with your actual database credentials
    db_config = {
        'host': 'localhost',      # Replace with your host
        'database': 'your_db',    # Replace with your database name
        'user': 'your_user',      # Replace with your username
        'password': 'your_pass',  # Replace with your password
        'port': 5432              # Replace with your port if different
    }
    
    # Connect to the database
    conn = connect_to_postgres(**db_config)
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Example query to test the connection
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        print("Database connection closed.")
    
    # Generate a random filename and save this script with that name
    random_filename = generate_random_filename()
    with open(__file__, 'r') as original_file:
        content = original_file.read()
    
    with open(f'/workspace/{random_filename}', 'w') as new_file:
        new_file.write(content)
    
    print(f"Script saved with random name: {random_filename}")

if __name__ == "__main__":
    main()