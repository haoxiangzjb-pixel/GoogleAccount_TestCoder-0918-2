#!/usr/bin/env python3
"""
PostgreSQL Connection Example using psycopg2
This script demonstrates how to connect to a PostgreSQL database.
"""

import psycopg2
from psycopg2 import sql
import os
import sys

def create_connection():
    """Create a connection to PostgreSQL database."""
    try:
        # Connection parameters - these would typically come from environment variables or a config file
        conn_params = {
            'dbname': os.environ.get('DB_NAME', 'postgres'),
            'user': os.environ.get('DB_USER', 'postgres'),
            'password': os.environ.get('DB_PASSWORD', ''),
            'host': os.environ.get('DB_HOST', 'localhost'),
            'port': os.environ.get('DB_PORT', '5432')
        }
        
        # Establish connection
        print("Connecting to PostgreSQL database...")
        conn = psycopg2.connect(**conn_params)
        print("Successfully connected to the database!")
        
        return conn
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        sys.exit(1)

def execute_sample_query(conn):
    """Execute a sample query to test the connection."""
    try:
        cursor = conn.cursor()
        
        # Create a sample table (if it doesn't exist)
        create_table_query = """
        CREATE TABLE IF NOT EXISTS employees (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            department VARCHAR(50),
            salary DECIMAL(10, 2)
        );
        """
        cursor.execute(create_table_query)
        
        # Insert sample data
        insert_query = """
        INSERT INTO employees (name, department, salary) 
        VALUES (%s, %s, %s)
        ON CONFLICT DO NOTHING;
        """
        sample_data = [
            ('John Doe', 'Engineering', 75000.00),
            ('Jane Smith', 'Marketing', 65000.00),
            ('Bob Johnson', 'Sales', 70000.00)
        ]
        
        cursor.executemany(insert_query, sample_data)
        
        # Query the data
        cursor.execute("SELECT * FROM employees;")
        records = cursor.fetchall()
        
        print("\nEmployee Records:")
        print("-" * 50)
        for row in records:
            print(f"ID: {row[0]}, Name: {row[1]}, Department: {row[2]}, Salary: ${row[3]}")
        
        # Commit changes
        conn.commit()
        cursor.close()
        
    except psycopg2.Error as e:
        print(f"Error executing query: {e}")
        conn.rollback()

def main():
    """Main function to run the PostgreSQL connection example."""
    # Create connection
    connection = create_connection()
    
    # Execute sample query
    execute_sample_query(connection)
    
    # Close connection
    connection.close()
    print("\nDatabase connection closed.")

if __name__ == "__main__":
    main()