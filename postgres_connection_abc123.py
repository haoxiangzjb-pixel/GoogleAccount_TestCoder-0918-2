import psycopg2
from psycopg2 import sql
import os
from typing import Optional

def connect_to_postgres(
    host: str = "localhost",
    database: str = "postgres",
    user: str = "postgres",
    password: str = "password",
    port: str = "5432"
) -> Optional[psycopg2.extensions.connection]:
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host: Database host
        database: Database name
        user: Database user
        password: Database password
        port: Database port
    
    Returns:
        Connection object if successful, None otherwise
    """
    try:
        # Establish the connection
        connection = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password,
            port=port
        )
        
        print("Successfully connected to PostgreSQL database")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def test_connection():
    """Test the PostgreSQL connection"""
    # You can set environment variables for security
    host = os.getenv('DB_HOST', 'localhost')
    database = os.getenv('DB_NAME', 'postgres')
    user = os.getenv('DB_USER', 'postgres')
    password = os.getenv('DB_PASSWORD', 'password')
    port = os.getenv('DB_PORT', '5432')
    
    conn = connect_to_postgres(host, database, user, password, port)
    
    if conn:
        try:
            # Create a cursor object
            cursor = conn.cursor()
            
            # Execute a simple query
            cursor.execute("SELECT version();")
            db_version = cursor.fetchone()
            print(f"PostgreSQL version: {db_version[0]}")
            
            # Close cursor and connection
            cursor.close()
            conn.close()
            print("Connection closed")
            
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
            if conn:
                conn.close()
        except Exception as e:
            print(f"Unexpected error: {e}")
            if conn:
                conn.close()
    else:
        print("Failed to establish connection")

if __name__ == "__main__":
    test_connection()