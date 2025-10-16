import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgres():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Connection parameters - replace these with your actual database credentials
        connection = psycopg2.connect(
            host="localhost",          # Database host
            database="your_database",  # Database name
            user="your_username",      # Database user
            password="your_password",  # Database password
            port="5432"               # Database port
        )
        
        print("Successfully connected to PostgreSQL!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False
    except Exception as e:
        print(f"Unexpected error: {e}")
        return False

if __name__ == "__main__":
    success = connect_to_postgres()
    if success:
        print("Database connection was successful!")
    else:
        print("Database connection failed!")
        sys.exit(1)