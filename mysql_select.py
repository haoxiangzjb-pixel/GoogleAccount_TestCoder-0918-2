import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    The results are printed to the console.
    """
    connection = None
    try:
        # Replace these connection details with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',          # e.g., 'localhost' or an IP address
            database='your_database',  # Your database name
            user='your_username',      # Your MySQL username
            password='your_password'   # Your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - replace with your actual query
            select_query = "SELECT * FROM your_table LIMIT 5;"
            cursor.execute(select_query)
            records = cursor.fetchall()

            print(f"Query executed: {select_query}")
            print(f"Number of rows fetched: {cursor.rowcount}")
            for row in records:
                print(row)

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    # Generate a random ID for execution log (optional)
    execution_id = str(uuid.uuid4())
    print(f"Execution ID: {execution_id}")
    execute_select_query()
