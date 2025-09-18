#!/usr/bin/env python3
"""
PostgreSQL Connection Script
Connects to a PostgreSQL database using psycopg2
"""

import psycopg2
from psycopg2 import sql
import random
import string
import os

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def connect_to_postgres():
    """Establish connection to PostgreSQL database"""
    try:
        # Database connection parameters
        # Note: In production, use environment variables or config files for credentials
        connection_params = {
            'host': 'localhost',
            'database': 'testdb',
            'user': 'postgres',
            'password': 'password',
            'port': '5432'
        }
        
        # Establish connection
        connection = psycopg2.connect(**connection_params)
        cursor = connection.cursor()
        
        # Print PostgreSQL connection properties
        print("Connected to PostgreSQL database")
        print("PostgreSQL connection properties:")
        print(connection.get_dsn_parameters())
        
        # Execute a simple query
        cursor.execute("SELECT version();")
        record = cursor.fetchone()
        print(f"PostgreSQL version: {record}")
        
        # Close database connection
        cursor.close()
        connection.close()
        print("PostgreSQL connection closed")
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while connecting to PostgreSQL: {error}")
        
def create_sample_table():
    """Create a sample table for demonstration"""
    try:
        connection_params = {
            'host': 'localhost',
            'database': 'testdb',
            'user': 'postgres',
            'password': 'password',
            'port': '5432'
        }
        
        connection = psycopg2.connect(**connection_params)
        cursor = connection.cursor()
        
        # Create table query
        create_table_query = '''
        CREATE TABLE IF NOT EXISTS employees (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            department VARCHAR(50),
            salary DECIMAL(10, 2)
        );
        '''
        
        cursor.execute(create_table_query)
        connection.commit()
        print("Table 'employees' created successfully")
        
        # Insert sample data
        insert_query = '''
        INSERT INTO employees (name, department, salary) VALUES
        (%s, %s, %s);
        '''
        sample_data = [
            ('John Doe', 'Engineering', 75000.00),
            ('Jane Smith', 'Marketing', 65000.00),
            ('Bob Johnson', 'Sales', 70000.00)
        ]
        
        cursor.executemany(insert_query, sample_data)
        connection.commit()
        print("Sample data inserted successfully")
        
        # Query the data
        cursor.execute("SELECT * FROM employees;")
        records = cursor.fetchall()
        print("Employee records:")
        for row in records:
            print(row)
            
        cursor.close()
        connection.close()
        
    except (Exception, psycopg2.Error) as error:
        print(f"Error while working with PostgreSQL: {error}")

if __name__ == "__main__":
    print("PostgreSQL Connection Test")
    print("=" * 30)
    connect_to_postgres()
    print()
    create_sample_table()