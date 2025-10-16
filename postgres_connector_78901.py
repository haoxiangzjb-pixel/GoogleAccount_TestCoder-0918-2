import psycopg2
from psycopg2 import sql
import os
from typing import Optional

class PostgreSQLConnector:
    """
    A class to handle PostgreSQL connections using psycopg2
    """
    
    def __init__(self, host: str = None, database: str = None, user: str = None, 
                 password: str = None, port: int = 5432):
        """
        Initialize the PostgreSQL connection parameters
        If parameters are not provided, the class will try to get them from environment variables
        """
        self.host = host or os.getenv('POSTGRES_HOST', 'localhost')
        self.database = database or os.getenv('POSTGRES_DB', 'postgres')
        self.user = user or os.getenv('POSTGRES_USER', 'postgres')
        self.password = password or os.getenv('POSTGRES_PASSWORD', '')
        self.port = port
        self.connection = None
        self.cursor = None
    
    def connect(self) -> bool:
        """
        Establish a connection to the PostgreSQL database
        """
        try:
            self.connection = psycopg2.connect(
                host=self.host,
                database=self.database,
                user=self.user,
                password=self.password,
                port=self.port
            )
            self.cursor = self.connection.cursor()
            print("Successfully connected to PostgreSQL database")
            return True
        except psycopg2.Error as e:
            print(f"Error connecting to PostgreSQL: {e}")
            return False
    
    def execute_query(self, query: str, params: Optional[tuple] = None):
        """
        Execute a SELECT query and return the results
        """
        try:
            if params:
                self.cursor.execute(query, params)
            else:
                self.cursor.execute(query)
            return self.cursor.fetchall()
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
            return None
    
    def execute_command(self, command: str, params: Optional[tuple] = None) -> bool:
        """
        Execute an INSERT, UPDATE, DELETE, or other command that doesn't return data
        """
        try:
            if params:
                self.cursor.execute(command, params)
            else:
                self.cursor.execute(command)
            self.connection.commit()
            return True
        except psycopg2.Error as e:
            print(f"Error executing command: {e}")
            self.connection.rollback()
            return False
    
    def close_connection(self):
        """
        Close the database connection
        """
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        print("PostgreSQL connection closed")


# Example usage
if __name__ == "__main__":
    # Create a connector instance
    # You can pass connection parameters directly or use environment variables
    db = PostgreSQLConnector(
        host="localhost",      # Replace with your host
        database="mydb",       # Replace with your database name
        user="myuser",         # Replace with your username
        password="mypass"      # Replace with your password
    )
    
    # Connect to the database
    if db.connect():
        # Example: Execute a simple query
        result = db.execute_query("SELECT version();")
        if result:
            print("Database version:", result[0][0])
        
        # Close the connection
        db.close_connection()
    else:
        print("Failed to connect to the database")