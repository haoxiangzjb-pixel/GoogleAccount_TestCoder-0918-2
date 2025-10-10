import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """Connects to MySQL and executes a SELECT query."""
    connection = None
    try:
        # Example connection parameters - replace with your actual details
        connection = mysql.connector.connect(
            host='localhost',          # Replace with your host
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Example SELECT query - replace with your actual query
            select_query = "SELECT * FROM your_table LIMIT 10;" # Replace with your table and query
            cursor.execute(select_query)

            # Fetch all results
            records = cursor.fetchall()

            print(f"Total number of rows: {cursor.rowcount}")
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
    execute_select_query()