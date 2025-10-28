import mysql.connector
import random
import string

def execute_mysql_select_query():
    """
    Connects to MySQL and executes a SELECT query
    """
    try:
        # Database connection parameters - update these with your actual credentials
        connection = mysql.connector.connect(
            host='localhost',  # or your MySQL server host
            database='your_database',  # replace with your database name
            user='your_username',  # replace with your MySQL username
            password='your_password'  # replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Example SELECT query - modify this query as needed
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            for row in records:
                print(row)
                
    except mysql.connector.Error as error:
        print(f"Error while connecting to MySQL: {error}")
        
    finally:
        # Close connections
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

if __name__ == "__main__":
    execute_mysql_select_query()