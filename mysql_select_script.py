import mysql.connector
import random
import string

def execute_select_query():
    """
    Connects to MySQL database and executes a SELECT query
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
            
            # Execute SELECT query
            # Replace 'your_table' with the actual table name
            select_query = "SELECT * FROM your_table LIMIT 10;"
            cursor.execute(select_query)
            
            # Fetch all records
            records = cursor.fetchall()
            
            print(f"Total number of records: {cursor.rowcount}")
            print("Records:")
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
    execute_select_query()
    
    # Generate random filename
    random_filename = generate_random_filename()
    print(f"Script saved to: {random_filename}")