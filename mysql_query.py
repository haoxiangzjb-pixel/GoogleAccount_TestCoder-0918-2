import mysql.connector
import uuid

# Generate a random filename
random_filename = f"query_result_{uuid.uuid4().hex}.txt"

# Database configuration (replace with your actual credentials)
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your database host
    'database': 'your_database_name',
}

try:
    # Establish the connection
    cnx = mysql.connector.connect(**config)
    cursor = cnx.cursor()

    # Define your SELECT query
    query = "SELECT * FROM your_table_name LIMIT 5;"  # Replace with your actual query

    # Execute the query
    cursor.execute(query)

    # Fetch all results
    results = cursor.fetchall()

    # Optionally, get column names
    column_names = [desc[0] for desc in cursor.description]

    # Write results to the randomly named file
    with open(random_filename, 'w') as f:
        # Write column headers
        f.write("\t".join(column_names) + "\n")
        # Write rows
        for row in results:
            f.write("\t".join(map(str, row)) + "\n")

    print(f"Query results saved to {random_filename}")

except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    # Close connections
    if cursor:
        cursor.close()
    if cnx:
        cnx.close()