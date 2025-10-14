import psycopg2
from psycopg2 import sql

def connect_to_db():
    """Connects to the PostgreSQL database server."""
    conn = None
    try:
        print('Connecting to the PostgreSQL database...')
        # Replace these connection parameters with your actual database credentials
        conn = psycopg2.connect(
            host="localhost",      # or your database server address
            database="your_db_name",
            user="your_username",
            password="your_password",
            port=5432              # default PostgreSQL port
        )

        # Create a cursor
        cur = conn.cursor()

        # Execute a statement
        cur.execute('SELECT version();')

        # Display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(f"PostgreSQL database version: {db_version[0]}")

        # Close communication with the database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

if __name__ == '__main__':
    connect_to_db()
