import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

def create_random_postgres_script():
    """Create a randomly named Python file with PostgreSQL connection code"""
    # The PostgreSQL connection code as a string
    postgres_code = '''import psycopg2
from psycopg2 import sql

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
    
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None

def main():
    # Example connection parameters (these would need to be updated with actual values)
    HOST = "localhost"  # Replace with your host
    DATABASE = "your_database"  # Replace with your database name
    USER = "your_username"  # Replace with your username
    PASSWORD = "your_password"  # Replace with your password
    PORT = 5432  # Default PostgreSQL port
    
    # Connect to PostgreSQL
    conn = connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        print("PostgreSQL connection is closed.")

if __name__ == "__main__":
    main()
'''
    
    # Generate random filename
    random_filename = generate_random_filename()
    
    # Write the code to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(postgres_code)
    
    print(f"PostgreSQL connection script saved to: {random_filename}")
    return random_filename

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
    
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None

def main():
    # Create a randomly named Python file with PostgreSQL connection code
    create_random_postgres_script()

if __name__ == "__main__":
    main()