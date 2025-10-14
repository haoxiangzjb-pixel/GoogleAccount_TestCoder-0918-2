import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database."""
    try:
        # Replace these connection parameters with your actual database details
        connection = psycopg2.connect(
            host="localhost",      # Database host
            database="your_db",    # Database name
            user="your_user",      # Username
            password="your_pass"   # Password
        )
        print("Successfully connected to PostgreSQL.")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

if __name__ == "__main__":
    conn = connect_to_db()
    if conn:
        conn.close()
        print("Connection closed.")