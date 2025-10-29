import psycopg2
from psycopg2 import sql
import sys

def connect_to_postgresql():
    """
    Connect to PostgreSQL database using psycopg2
    """
    try:
        # Database connection parameters
        connection = psycopg2.connect(
            host="localhost",          # Change this to your PostgreSQL host
            database="your_database",  # Change this to your database name
            user="your_username",      # Change this to your username
            password="your_password"   # Change this to your password
        )
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except psycopg2.Error as error:
        print(f"Error connecting to PostgreSQL: {error}")
        return False
    except Exception as e:
        print(f"Unexpected error: {e}")
        return False

def execute_query(connection, query):
    """
    Execute a given SQL query on the PostgreSQL database
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        return result
    except psycopg2.Error as error:
        print(f"Error executing query: {error}")
        return None

if __name__ == "__main__":
    print("Attempting to connect to PostgreSQL...")
    connect_to_postgresql()