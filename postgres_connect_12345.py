import psycopg2
from psycopg2 import sql
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
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
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        return connection
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return None

def main():
    # Example connection parameters (these would need to be updated with actual values)
    HOST = "localhost"  # or your database host
    DATABASE = "your_database_name"
    USER = "your_username"
    PASSWORD = "your_password"
    PORT = 5432  # default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
    
    if conn:
        # Perform database operations here
        # For example, creating a table or querying data
        
        # Close the connection when done
        conn.close()
        print("PostgreSQL connection closed.")
    else:
        print("Failed to connect to the database.")

if __name__ == "__main__":
    main()