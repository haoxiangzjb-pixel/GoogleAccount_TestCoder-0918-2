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
        print("Connected to PostgreSQL database!")
        cur = conn.cursor()
        # Example query
        cur.execute('SELECT version();')
        db_version = cur.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        # Close the database connection
        if conn is not None:
            conn.close()
            print("Database connection closed.")

if __name__ == '__main__':
    connect_to_db()