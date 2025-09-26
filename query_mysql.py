import mysql.connector
import uuid

def execute_select_query():
    """
    Connects to a MySQL database and executes a SELECT query.
    Results are printed to the console.
    """
    try:
        # Establish a connection to the database
        # Replace 'localhost', 'username', 'password', and 'database_name' with your actual details
        connection = mysql.connector.connect(
            host='localhost',
            user='username',
            password='password',
            database='database_name'
        )

        cursor = connection.cursor()

        # Define your SELECT query here
        query = "SELECT * FROM your_table_name LIMIT 5;"
        cursor.execute(query)

        # Fetch all results
        results = cursor.fetchall()

        # Print the results
        for row in results:
            print(row)

    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Close the cursor and connection
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    execute_select_query()