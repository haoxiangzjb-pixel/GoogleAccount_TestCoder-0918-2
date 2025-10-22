import mysql.connector
import random
import string

def execute_mysql_select():
    """
    Connects to MySQL and executes a SELECT query
    """
    try:
        # Establish connection to MySQL
        connection = mysql.connector.connect(
            host='localhost',  # Change this to your MySQL host
            database='your_database',  # Change this to your database name
            user='your_username',  # Change this to your MySQL username
            password='your_password'  # Change this to your MySQL password
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL database")
            
            # Create cursor object
            cursor = connection.cursor()
            
            # Execute a SELECT query (example - replace with your query)
            query = "SELECT * FROM your_table LIMIT 10;"  # Change this to your table and query
            cursor.execute(query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            # Print the records
            print("Total number of records:", cursor.rowcount)
            for row in records:
                print(row)
                
    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    # Execute the MySQL query
    execute_mysql_select()
