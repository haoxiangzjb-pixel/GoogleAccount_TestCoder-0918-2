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
    Returns a connection object.
    """
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        conn_params = {
            'dbname': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'host': 'localhost',  # or your database server IP
            'port': '5432'        # default PostgreSQL port
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**conn_params)
        print("Connected to PostgreSQL database successfully!")
        return conn
    
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def execute_sample_query(conn):
    """
    Executes a sample query on the database.
    """
    try:
        cursor = conn.cursor()
        
        # Sample query (this would normally be something meaningful)
        cursor.execute("SELECT version();")
        db_version = cursor.fetchone()
        print(f"Database version: {db_version[0]}")
        
        # Close cursor
        cursor.close()
        
    except psycopg2.Error as e:
        print(f"Error executing query: {e}")

def main():
    """
    Main function to demonstrate PostgreSQL connection.
    """
    # Connect to PostgreSQL
    connection = connect_to_postgres()
    
    if connection:
        # Execute a sample query
        execute_sample_query(connection)
        
        # Close the connection
        connection.close()
        print("Database connection closed.")

if __name__ == "__main__":
    main()