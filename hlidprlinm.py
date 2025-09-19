import mysql.connector

# Database connection configuration
config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'database': 'your_database',
    'raise_on_warnings': True
}

# SQL SELECT query
query = "SELECT * FROM your_table"

try:
    # Establishing connection to MySQL database
    connection = mysql.connector.connect(**config)
    
    # Creating cursor object to execute queries
    cursor = connection.cursor()
    
    # Executing the SELECT query
    cursor.execute(query)
    
    # Fetching all results
    records = cursor.fetchall()
    
    # Printing the results
    print("Total number of rows in table: ", cursor.rowcount)
    print("\nPrinting each row's column values:")
    for row in records:
        print(row)
        
except mysql.connector.Error as error:
    print("Failed to execute SELECT query: {}".format(error))
    
finally:
    # Closing database connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("\nMySQL connection is closed")