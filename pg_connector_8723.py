#!/usr/bin/env python3
"""
Simple PostgreSQL Connection Script
Demonstrates connecting to PostgreSQL with psycopg2
"""

import psycopg2
import os

# Database connection parameters
DB_CONFIG = {
    'host': os.getenv('PG_HOST', 'localhost'),
    'database': os.getenv('PG_DATABASE', 'postgres'),
    'user': os.getenv('PG_USER', 'postgres'),
    'password': os.getenv('PG_PASSWORD', ''),
    'port': os.getenv('PG_PORT', '5432')
}

def connect_to_db():
    """Establish connection to PostgreSQL database."""
    try:
        print("Attempting to connect to PostgreSQL...")
        conn = psycopg2.connect(**DB_CONFIG)
        print("Connection successful!")
        return conn
    except psycopg2.Error as e:
        print(f"Error connecting to PostgreSQL: {e}")
        return None

def main():
    """Main execution function."""
    connection = connect_to_db()
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT version();")
            db_version = cursor.fetchone()
            print(f"PostgreSQL version: {db_version[0]}")
            
            cursor.close()
            connection.close()
            print("Connection closed.")
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")

if __name__ == "__main__":
    main()