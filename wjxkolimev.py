import psycopg2

def connect_to_postgres(host, database, user, password, port=5432):
    """
    Connect to PostgreSQL database using psycopg2
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
        
        print("Successfully connected to PostgreSQL database!")
        
        # Create a cursor object
        cursor = connection.cursor()
        
        # Execute a simple query to test the connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor and connection
        cursor.close()
        connection.close()
        
        print("Connection closed.")
        return True
        
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return False

if __name__ == "__main__":
    # Example usage (replace with your actual database credentials)
    HOST = "localhost"  # or your database host
    DATABASE = "your_database_name"
    USER = "your_username"
    PASSWORD = "your_password"
    PORT = 5432  # default PostgreSQL port
    
    # Connect to the database
    connect_to_postgres(HOST, DATABASE, USER, PASSWORD, PORT)
