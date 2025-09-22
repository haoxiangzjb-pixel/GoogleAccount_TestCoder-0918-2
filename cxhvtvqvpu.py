import mysql.connector
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def execute_select_query():
    """Execute a SELECT query on MySQL database"""
    try:
        # Database connection parameters
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()
        
        # Execute SELECT query
        query = "SELECT * FROM your_table LIMIT 10"
        cursor.execute(query)
        
        # Fetch and print results
        records = cursor.fetchall()
        print("Total number of rows in table: ", cursor.rowcount)
        print("\nPrinting each row:")
        for row in records:
            print(row)
            
    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")
        
    finally:
        # Close connections
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("\nMySQL connection is closed")

if __name__ == "__main__":
    filename = generate_random_filename()
    print(f"Executing SELECT query from file: {filename}")
    execute_select_query()