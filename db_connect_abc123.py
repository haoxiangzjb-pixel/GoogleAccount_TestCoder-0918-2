import psycopg2
from psycopg2 import sql

def connect_to_db():
  """Connects to the PostgreSQL database."""
  try:
    # --- Replace these values with your actual database credentials ---
    connection = psycopg2.connect(
        host="localhost",      # e.g., 'localhost', '127.0.0.1', or a remote IP
        database="your_db_name",
        user="your_username",
        password="your_password",
        port=5432              # Default PostgreSQL port
    )
    return connection
  except psycopg2.OperationalError as e:
    print(f"Error connecting to PostgreSQL: {e}")
    return None

def main():
  """Main function to demonstrate the connection."""
  conn = connect_to_db()
  if conn:
    print("Successfully connected to PostgreSQL!")
    # Example: Create a cursor to interact with the database
    cursor = conn.cursor()
    
    # Example: Execute a simple query
    cursor.execute('SELECT version();')
    db_version = cursor.fetchone()
    print(f"PostgreSQL Database version: {db_version[0]}")
    
    # Close the cursor and connection
    cursor.close()
    conn.close()
    print("PostgreSQL connection is closed.")
  else:
    print("Failed to connect to PostgreSQL.")

if __name__ == "__main__":
    main()