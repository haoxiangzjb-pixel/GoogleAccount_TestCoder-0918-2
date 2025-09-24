import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    The script is saved with a random name.
    """
    connection = None
    try:
        # --- Configuration ---
        # Replace these values with your actual database credentials
        config = {
            'host': 'localhost',
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password'
        }
        
        connection = mysql.connector.connect(**config)
        
        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query. Modify this as needed.
            query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(query)
            
            records = cursor.fetchall()
            print(f"Query executed: {query}")
            print("Results:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # This script was generated with a random name: mysql_query_{uuid.uuid4().hex[:8]}.py
    execute_select_query()
