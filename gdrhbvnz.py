#!/usr/bin/env python3
"""
PostgreSQL Connection Script using psycopg2
"""

import psycopg2
from psycopg2 import sql

def connect_to_postgresql():
    """Establish a connection to PostgreSQL database"""
    try:
        # Database connection parameters
        # Please update these with your actual database credentials
        connection_params = {
            'host': 'localhost',
            'database': 'your_database_name',
            'user': 'your_username',
            'password': 'your_password',
            'port': '5432'
        }
        
        # Establishing the connection
        conn = psycopg2.connect(**connection_params)
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query
        cur.execute("SELECT version();")
        
        # Fetch result
        db_version = cur.fetchone()
        print(f"Connected to PostgreSQL database. Version: {db_version[0]}")
        
        # Close the cursor and connection
        cur.close()
        conn.close()
        
        return True
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        return False

if __name__ == "__main__":
    connect_to_postgresql()