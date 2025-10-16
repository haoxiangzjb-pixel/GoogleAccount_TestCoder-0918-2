import psycopg2

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
    
    Args:
        host (str): PostgreSQL server host
        database (str): Database name
        user (str): Username
        password (str): Password
        port (int): Port number (default 5432)
    
    Returns:
        connection: psycopg2 connection object
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
        print(f"Error connecting to PostgreSQL: {{e}}")
        return None

def main():
    # Example connection parameters (these would need to be updated with actual values)
    host = "localhost"  # or your PostgreSQL server address
    database = "your_database_name"
    user = "your_username"
    password = "your_password"
    port = 5432  # default PostgreSQL port
    
    # Connect to the database
    conn = connect_to_postgres(host, database, user, password, port)
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL database version: {{db_version[0]}}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        print("PostgreSQL connection is closed")

if __name__ == "__main__":
    main()
