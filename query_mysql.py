import mysql.connector
from mysql.connector import Error
import uuid

def execute_select_query():
    """Connects to MySQL and executes a SELECT query."""
    connection = None
    cursor = None
    try:
        # Example connection parameters - replace with your actual details
        connection = mysql.connector.connect(
            host='localhost',  # or your MySQL server address
            database='your_database_name',
            user='your_username',
            password='your_password'
        )

        if connection.is_connected():
            print("Successfully connected to MySQL database")
            cursor = connection.cursor()
            # Example SELECT query - replace with your actual query
            select_query = "SELECT * FROM your_table_name LIMIT 10;"
            cursor.execute(select_query)
            records = cursor.fetchall()

            print("Records from the table:")
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
    execute_select_query()
