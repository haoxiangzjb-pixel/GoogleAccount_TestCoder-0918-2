#!/usr/bin/env python3
"""
Script to connect to PostgreSQL using psycopg2.
"""

import psycopg2
from psycopg2 import Error


def connect_to_postgresql():
    """
    Establish a connection to a PostgreSQL database.
    
    Replace the placeholder values with your actual database credentials.
    """
    connection = None
    try:
        # Connection parameters - update these with your actual credentials
        connection = psycopg2.connect(
            host="localhost",
            database="your_database_name",
            user="your_username",
            password="your_password",
            port="5432"
        )
        
        # Create a cursor to perform database operations
        cursor = connection.cursor()
        
        # Execute a simple query to verify connection
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Successfully connected to PostgreSQL!")
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close the cursor
        cursor.close()
        
        return connection
        
    except Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None


def main():
    """Main function to demonstrate PostgreSQL connection."""
    conn = connect_to_postgresql()
    
    if conn:
        print("\nConnection established successfully.")
        # Perform your database operations here
        
        # Close the connection when done
        conn.close()
        print("Database connection closed.")
    else:
        print("\nFailed to establish database connection.")


if __name__ == "__main__":
    main()
