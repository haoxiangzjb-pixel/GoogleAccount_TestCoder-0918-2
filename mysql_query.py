import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    cursor = None
    try:
        # Replace these connection parameters with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',  # e.g., 'localhost' or an IP address
            database='your_database_name',
            user='your_username',
            password='your_password'
        )

        if connection.is_connected():
            print("Successfully connected to the database")
            cursor = connection.cursor()
            
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(select_query)
            
            records = cursor.fetchall()
            print(f"Total number of rows: {cursor.rowcount}")
            print("Query Results:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            if cursor:
                cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    # Generate a random name for the script (for demonstration, as the file itself is already named)
    random_script_name = f"executed_script_{uuid.uuid4().hex[:8]}.py"
    print(f"Executing query script: {random_script_name}")
    execute_select_query()
