import mysql.connector
from mysql.connector import Error

def execute_select_query():
    connection = None
    try:
        # Replace these connection details with your actual database credentials
        connection = mysql.connector.connect(
            host='localhost',  # or your database host
            port=3306,         # or your database port
            database='your_database_name',
            user='your_username',
            password='your_password'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Replace 'your_table_name' and 'your_columns' with actual names
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
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    execute_select_query()
