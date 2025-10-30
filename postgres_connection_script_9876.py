import psycopg2
from psycopg2 import sql
import os
from typing import Optional

class PostgreSQLConnector:
    """
    A class to handle PostgreSQL connections using psycopg2
    """
    
    def __init__(self, host: str = "localhost", database: str = "postgres", 
                 user: str = "postgres", password: str = "", port: int = 5432):
        """
        Initialize the PostgreSQL connection parameters
        
        Args:
            host: Database host address
            database: Name of the database
            user: Database user
            password: Password for the user
            port: Database port
        """
        self.host = host
        self.database = database
        self.user = user
        self.password = password
        self.port = port
        self.connection = None
        self.cursor = None
    
    def connect(self) -> bool:
        """
        Establish a connection to the PostgreSQL database
        
        Returns:
            bool: True if connection is successful, False otherwise
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
            print(f"Error connecting to PostgreSQL database: {e}")
            return False
    
    def execute_query(self, query: str, params: Optional[tuple] = None):
        """
        Execute a SELECT query
        
        Args:
            query: SQL query to execute
            params: Parameters for the query
            
        Returns:
            List of tuples containing the query results
        """
        try:
            self.cursor.execute(query, params)
            results = self.cursor.fetchall()
            return results
        except psycopg2.Error as e:
            print(f"Error executing query: {e}")
            return None
    
    def execute_command(self, command: str, params: Optional[tuple] = None) -> bool:
        """
        Execute an INSERT, UPDATE, DELETE, or other command
        
        Args:
            command: SQL command to execute
            params: Parameters for the command
            
        Returns:
            bool: True if command executed successfully, False otherwise
        """
        try:
            self.cursor.execute(command, params)
            self.connection.commit()
            return True
        except psycopg2.Error as e:
            print(f"Error executing command: {e}")
            self.connection.rollback()
            return False
    
    def close_connection(self):
        """
        Close the database connection and cursor
        """
        if self.cursor:
            self.cursor.close()
        if self.connection:
            self.connection.close()
        print("PostgreSQL connection closed")


def main():
    """
    Example usage of the PostgreSQLConnector class
    """
    # You can set environment variables for security
    db_host = os.getenv("DB_HOST", "localhost")
    db_name = os.getenv("DB_NAME", "postgres")
    db_user = os.getenv("DB_USER", "postgres")
    db_password = os.getenv("DB_PASSWORD", "")  # In production, use environment variables
    db_port = int(os.getenv("DB_PORT", 5432))
    
    # Create connector instance
    db = PostgreSQLConnector(
        host=db_host,
        database=db_name,
        user=db_user,
        password=db_password,
        port=db_port
    )
    
    # Connect to the database
    if db.connect():
        # Example: Execute a simple query
        result = db.execute_query("SELECT version();")
        if result:
            print("Database version:", result[0][0])
        
        # Close the connection
        db.close_connection()


if __name__ == "__main__":
    main()