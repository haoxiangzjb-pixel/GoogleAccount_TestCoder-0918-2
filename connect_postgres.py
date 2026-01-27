#!/usr/bin/env python3
"""
Script to connect to PostgreSQL using psycopg2 and perform basic operations.
"""

import psycopg2
from psycopg2 import sql, extras

def connect_to_postgres(
    host="localhost",
    port=5432,
    database="your_database",
    user="your_username",
    password="your_password"
):
    """
    Connect to a PostgreSQL database and return the connection object.
    
    Args:
        host (str): Database host address
        port (int): Database port number
        database (str): Database name
        user (str): Username for authentication
        password (str): Password for authentication
        
    Returns:
        psycopg2.connection: Connection object if successful
    """
    try:
        # Establish connection to PostgreSQL
        connection = psycopg2.connect(
            host=host,
            port=port,
            database=database,
            user=user,
            password=password
        )
        
        print(f"Successfully connected to PostgreSQL!")
        print(f"Database: {database}")
        print(f"Host: {host}:{port}")
        
        return connection
    
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        raise


def create_table(connection, table_name="example_table"):
    """
    Create a sample table in the database.
    
    Args:
        connection (psycopg2.connection): Active database connection
        table_name (str): Name of the table to create
    """
    cursor = connection.cursor()
    
    try:
        # SQL statement to create a table
        create_table_query = sql.SQL("""
            CREATE TABLE IF NOT EXISTS {} (
                id SERIAL PRIMARY KEY,
                name VARCHAR(100) NOT NULL,
                email VARCHAR(100) UNIQUE NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )
        """).format(sql.Identifier(table_name))
        
        cursor.execute(create_table_query)
        connection.commit()
        print(f"Table '{table_name}' created successfully (or already exists).")
        
    except psycopg2.Error as e:
        print(f"Error creating table: {e}")
        connection.rollback()
    
    finally:
        cursor.close()


def insert_data(connection, table_name="example_table"):
    """
    Insert sample data into the table.
    
    Args:
        connection (psycopg2.connection): Active database connection
        table_name (str): Name of the table to insert data into
    """
    cursor = connection.cursor(cursor_factory=extras.DictCursor)
    
    try:
        # Sample data to insert
        insert_query = sql.SQL("""
            INSERT INTO {} (name, email) VALUES (%s, %s)
        """).format(sql.Identifier(table_name))
        
        # Insert multiple records
        data_to_insert = [
            ("Alice Johnson", "alice@example.com"),
            ("Bob Smith", "bob@example.com"),
            ("Charlie Brown", "charlie@example.com")
        ]
        
        cursor.executemany(insert_query, data_to_insert)
        connection.commit()
        print(f"{cursor.rowcount} records inserted into '{table_name}'.")
        
    except psycopg2.Error as e:
        print(f"Error inserting data: {e}")
        connection.rollback()
    
    finally:
        cursor.close()


def fetch_data(connection, table_name="example_table"):
    """
    Fetch and display data from the table.
    
    Args:
        connection (psycopg2.connection): Active database connection
        table_name (str): Name of the table to fetch data from
        
    Returns:
        list: List of tuples containing the fetched data
    """
    cursor = connection.cursor(cursor_factory=extras.DictCursor)
    
    try:
        select_query = sql.SQL("SELECT * FROM {} ORDER BY id").format(sql.Identifier(table_name))
        cursor.execute(select_query)
        
        records = cursor.fetchall()
        
        print(f"\nData from '{table_name}':")
        print("-" * 60)
        
        # Display column headers
        if records:
            print(f"{'ID':<5} {'Name':<25} {'Email':<30} {'Created At':<20}")
            print("-" * 60)
            
            # Display each row
            for record in records:
                print(f"{record['id']:<5} {record['name']:<25} {record['email']:<30} {record['created_at']:<20}")
        
        return records
    
    except psycopg2.Error as e:
        print(f"Error fetching data: {e}")
        return []
    
    finally:
        cursor.close()


def close_connection(connection):
    """
    Close the database connection.
    
    Args:
        connection (psycopg2.connection): Connection object to close
    """
    if connection:
        connection.close()
        print("\nDatabase connection closed.")


if __name__ == "__main__":
    # Configure your PostgreSQL connection parameters here
    CONFIG = {
        "host": "localhost",
        "port": 5432,
        "database": "your_database",      # Replace with your database name
        "user": "your_username",          # Replace with your username
        "password": "your_password"       # Replace with your password
    }
    
    # Connect to PostgreSQL
    conn = connect_to_postgres(**CONFIG)
    
    if conn:
        try:
            # Create a table
            create_table(conn, "users")
            
            # Insert sample data
            insert_data(conn, "users")
            
            # Fetch and display data
            fetch_data(conn, "users")
            
        finally:
            # Always close the connection
            close_connection(conn)
