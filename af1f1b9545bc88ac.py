#!/usr/bin/env python3
"""
PostgreSQL connection script using psycopg2.
"""

import psycopg2
from psycopg2 import OperationalError


def connect_to_postgresql():
    """
    Establish a connection to a PostgreSQL database.
    
    Replace the connection parameters with your actual database credentials.
    """
    try:
        connection = psycopg2.connect(
            host="localhost",
            port=5432,
            database="your_database_name",
            user="your_username",
            password="your_password"
        )
        
        print("Successfully connected to PostgreSQL!")
        return connection
        
    except OperationalError as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None


def main():
    conn = connect_to_postgresql()
    
    if conn:
        # Create a cursor object
        cursor = conn.cursor()
        
        # Example: Execute a simple query
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"PostgreSQL version: {db_version[0]}")
        
        # Close cursor and connection
        cursor.close()
        conn.close()
        print("Connection closed.")


if __name__ == "__main__":
    main()
