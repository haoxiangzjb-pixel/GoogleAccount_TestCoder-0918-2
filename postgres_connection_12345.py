import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        # Connect to the PostgreSQL server
        conn = psycopg2.connect(
            host="localhost",      # Replace with your host
            database="your_db",    # Replace with your database name
            user="your_user",      # Replace with your username
            password="your_pass"   # Replace with your password
        )
        print("Connected to the PostgreSQL server successfully.")
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a sample query
        cur.execute('SELECT version()')
        
        # Fetch the result
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version}")
        
        # Close the cursor
        cur.close()
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f"Error connecting to PostgreSQL: {error}")
    
    finally:
        # Close the connection
        if conn is not None:
            conn.close()
            print("PostgreSQL connection closed.")

if __name__ == '__main__':
    connect_to_db()