import psycopg2
from psycopg2 import sql

# Database connection parameters
DB_PARAMS = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or the host address of your database
    'port': '5432'        # default PostgreSQL port
}

def connect_to_db():
    """
    Connects to the PostgreSQL database using the parameters defined in DB_PARAMS.
    Returns the connection object if successful, otherwise prints an error and returns None.
    """
    try:
        print("Attempting to connect to PostgreSQL...")
        connection = psycopg2.connect(**DB_PARAMS)
        print("Connection successful!")
        return connection
    except psycopg2.OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    conn = connect_to_db()
    if conn:
        print("Connected to the database successfully.")
        # Example: Create a cursor and execute a simple query
        cursor = conn.cursor()
        cursor.execute('SELECT version();')
        db_version = cursor.fetchone()
        print(f"PostgreSQL Database Version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        conn.close()
        print("Database connection closed.")
    else:
        print("Failed to establish a database connection.")

if __name__ == "__main__":
    main()