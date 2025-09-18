import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    try:
        # Connection parameters - replace with your actual database credentials
        conn = psycopg2.connect(
            host="localhost",
            database="your_database_name",
            user="your_username",
            password="your_password",
            port="5432"
        )
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"Connected to PostgreSQL database. Version: {db_version[0]}")
        
        # Close cursor and connection
        cur.close()
        conn.close()
        
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False

if __name__ == "__main__":
    connect_to_postgres()