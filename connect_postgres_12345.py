import psycopg2
from psycopg2 import sql

def connect_to_db():
  """
  Connects to the PostgreSQL database using psycopg2.

  Replace the connection parameters (host, database, user, password, port)
  with your actual database credentials.
  """
  try:
    # Replace these placeholders with your actual database connection details
    connection = psycopg2.connect(
        host="localhost",      # e.g., "localhost" or an IP address
        database="your_db_name", # e.g., "my_app_db"
        user="your_username",    # e.g., "postgres"
        password="your_password", # e.g., "my_secret_password"
        port="5432"            # Default PostgreSQL port is 5432
    )
    print("Successfully connected to PostgreSQL!")
    return connection
  except psycopg2.Error as e:
    print(f"Error connecting to PostgreSQL: {e}")
    return None

def main():
  conn = connect_to_db()
  if conn:
    # Example: Create a cursor and execute a simple query
    cur = conn.cursor()
    cur.execute('SELECT version();')
    db_version = cur.fetchone()
    print(f"PostgreSQL Database Version: {db_version[0]}")

    # It's good practice to close the cursor and connection
    cur.close()
    conn.close()
    print("Connection closed.")

if __name__ == "__main__":
    main()