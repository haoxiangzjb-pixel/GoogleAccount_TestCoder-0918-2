import mysql.connector
from mysql.connector import Error
import os
import random
import string

def execute_select_query():
    """
    Connects to MySQL and executes a SELECT query
    """
    connection = None
    cursor = None
    
    try:
        # Database connection parameters - these would need to be configured for your specific setup
        host = os.getenv('DB_HOST', 'localhost')
        database = os.getenv('DB_NAME', 'your_database_name')
        user = os.getenv('DB_USER', 'your_username')
        password = os.getenv('DB_PASSWORD', 'your_password')
        
        # Establish connection
        connection = mysql.connector.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        
        if connection.is_connected():
            print(f"Successfully connected to MySQL database: {database}")
            
            cursor = connection.cursor()
            
            # Example SELECT query - modify this as needed for your database
            select_query = "SELECT * FROM information_schema.tables LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("\nRecords:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("\nMySQL connection is closed")

def generate_random_table_name():
    """
    Generates a random table name for demonstration purposes
    """
    letters = string.ascii_lowercase
    return 'table_' + ''.join(random.choice(letters) for i in range(8))

if __name__ == "__main__":
    print("Executing MySQL SELECT query...")
    execute_select_query()
    
    # Example of generating a random name (as mentioned in the requirement)
    random_name = generate_random_table_name()
    print(f"\nRandomly generated name example: {random_name}")