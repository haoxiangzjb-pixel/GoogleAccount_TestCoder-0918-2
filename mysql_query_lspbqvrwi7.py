import mysql.connector
import random
import string

def execute_select_query():
    """
    Executes a SELECT query on MySQL database
    """
    try:
        # Database connection parameters - you'll need to update these
        config = {
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your MySQL server host
            'database': 'your_database',
            'raise_on_warnings': True
        }
        
        # Establish connection
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        
        # Example SELECT query - modify as needed
        query = "SELECT * FROM your_table LIMIT 10;"
        cursor.execute(query)
        
        # Fetch results
        results = cursor.fetchall()
        
        # Print results
        for row in results:
            print(row)
        
        # Get column names
        column_names = [i[0] for i in cursor.description]
        print(f"Columns: {column_names}")
        
        # Close connections
        cursor.close()
        cnx.close()
        
        print(f"Successfully executed SELECT query and retrieved {len(results)} rows")
        
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    except Exception as e:
        print(f"An error occurred: {e}")

def generate_random_filename():
    """
    Generates a random filename with .py extension
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"mysql_query_{random_string}.py"

if __name__ == "__main__":
    # Execute the SELECT query
    execute_select_query()
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Random filename generated: {random_filename}")