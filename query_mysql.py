import mysql.connector
import os
import uuid

# Generate a random filename for the output
random_filename = f"query_results_{uuid.uuid4().hex}.txt"

# Database connection details (these might need to be changed based on your setup)
config = {
    'user': 'root',
    'password': os.getenv('MYSQL_ROOT_PASSWORD', 'password'), # Use environment variable for password
    'host': os.getenv('MYSQL_HOST', 'localhost'),
    'database': os.getenv('MYSQL_DATABASE', 'test_db'),
    'raise_on_warnings': True
}

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Example SELECT query
    query = "SELECT * FROM example_table LIMIT 5;"
    cursor.execute(query)

    # Fetch all results
    rows = cursor.fetchall()

    # Write results to the randomly named file
    with open(random_filename, 'w') as f:
        for row in rows:
            f.write(str(row) + '\n')

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals() and cnx.is_connected():
        cnx.close()
        print("MySQL connection is closed")