import mysql.connector
import uuid

# Database configuration
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',  # or your host address
    'database': 'your_database_name',
    'raise_on_warnings': True
}

# Establish a connection
cnx = mysql.connector.connect(**config)

# Create a cursor object
cursor = cnx.cursor()

# Define your SELECT query
query = "SELECT * FROM your_table_name LIMIT 10;"  # Modify this query as needed

# Execute the query
cursor.execute(query)

# Fetch all results
results = cursor.fetchall()

# Print the results
for row in results:
    print(row)

# Get the column names
column_names = [i[0] for i in cursor.description]
print("\nColumn Names:", column_names)

# Close the cursor and connection
cursor.close()
cnx.close()

# Generate a random filename
random_filename = f"query_output_{uuid.uuid4().hex}.txt"

# Optionally, save results to the randomly named file
with open(random_filename, 'w') as f:
    f.write("Column Names: " + str(column_names) + "\\n")
    for row in results:
        f.write(str(row) + "\\n")

print(f"\\nResults also saved to {random_filename}")