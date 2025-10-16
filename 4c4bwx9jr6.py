import psycopg2
from psycopg2 import sql
import random
import string

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to a PostgreSQL database using psycopg2
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
        
        print("Successfully connected to PostgreSQL database")
        return connection
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def execute_query(connection, query):
    """
    Execute a SQL query on the given connection
    """
    try:
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.close()
        return result
        
    except psycopg2.Error as e:
        print(f"Error executing query: {e}")
        return None

def close_connection(connection):
    """
    Close the database connection
    """
    if connection:
        connection.close()
        print("PostgreSQL connection closed")

# Example usage
if __name__ == "__main__":
    # Database connection parameters
    # Note: In a real application, these should be loaded from environment variables or a secure config
    db_host = "localhost"  # Replace with your host
    db_name = "your_database"  # Replace with your database name
    db_user = "your_username"  # Replace with your username
    db_password = "your_password"  # Replace with your password
    db_port = 5432  # Default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(db_host, db_name, db_user, db_password, db_port)
    
    if conn:
        # Example query (replace with your actual query)
        sample_query = "SELECT version();"
        result = execute_query(conn, sample_query)
        
        if result:
            print("Query result:", result)
        
        # Close the connection
        close_connection(conn)