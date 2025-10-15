import mysql.connector
import random
import string
from mysql.connector import Error

def execute_select_query():
    """
    Connects to MySQL database and executes a SELECT query
    """
    try:
        # Database connection parameters - update these with your actual database details
        connection = mysql.connector.connect(
            host='localhost',          # Replace with your MySQL host
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this query according to your table structure
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Replace with your actual query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Saving script to: {random_filename}")
    
    # Get the content of this script
    script_content = '''import mysql.connector
import random
import string
from mysql.connector import Error

def execute_select_query():
    """
    Connects to MySQL database and executes a SELECT query
    """
    try:
        # Database connection parameters - update these with your actual database details
        connection = mysql.connector.connect(
            host='localhost',          # Replace with your MySQL host
            database='your_database',  # Replace with your database name
            user='your_username',      # Replace with your MySQL username
            password='your_password'   # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this query according to your table structure
            select_query = "SELECT * FROM your_table LIMIT 10;"  # Replace with your actual query
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
            for row in records:
                print(row)
                
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    execute_select_query()
'''
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(script_content)
    
    print(f"Script saved to {random_filename}")
    print("You can now run the script with: python " + random_filename)