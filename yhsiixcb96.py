#!/usr/bin/env python3
"""
PostgreSQL Connection Script
This script demonstrates how to connect to a PostgreSQL database using psycopg2.
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgres():
    """
    Establishes a connection to a PostgreSQL database.
    
    Returns:
        connection object or None
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        connection_params = {
            'host': 'localhost',        # Your host
            'database': 'mydb',         # Your database name
            'user': 'myuser',           # Your username
            'password': 'mypassword',   # Your password
            'port': '5432'              # Your port (default is 5432)
        }
        
        # Connect to the PostgreSQL server
        print('Connecting to PostgreSQL database...')
        conn = psycopg2.connect(**connection_params)
        
        # Create a cursor
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute('SELECT version()')
        
        # Fetch the result
        db_version = cur.fetchone()
        print(f'PostgreSQL database version: {db_version[0]}')
        
        # Close the cursor and connection
        cur.close()
        return conn
        
    except (Exception, psycopg2.DatabaseError) as error:
        print(f'Error while connecting to PostgreSQL: {error}')
        return None

def main():
    """Main function to demonstrate PostgreSQL connection."""
    conn = connect_to_postgres()
    if conn is not None:
        print("Connection successful!")
        conn.close()
        print("Connection closed.")
    else:
        print("Connection failed.")

if __name__ == '__main__':
    main()