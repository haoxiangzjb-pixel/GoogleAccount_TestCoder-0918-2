import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    connection = None
    try:
        # --- Configuration: Update these values ---
        config = {
            'host': 'localhost',  # e.g., 'localhost' or an IP address
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password'
        }

        connection = mysql.connector.connect(**config)

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - modify as needed
            select_query = "SELECT * FROM your_table_name LIMIT 5;"
            cursor.execute(select_query)

            records = cursor.fetchall()
            print(f"Total number of rows: {cursor.rowcount}")
            print("\nPrinting each row:")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("\nMySQL connection is closed.")

if __name__ == "__main__":
    # Generate a random file name for the script
    random_file_name = f"mysql_query_script_{uuid.uuid4().hex[:8]}.py"
    print(f"This script is named: {random_file_name}")
    print("Please configure the database connection details in the script before running.")
    execute_select_query()
