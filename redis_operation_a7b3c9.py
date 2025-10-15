#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
This script has a randomly generated filename.
"""

import redis
import sys
import random
import string

def generate_random_key():
    """Generate a random key name."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def set_redis_key_value(host='localhost', port=6379, db=0, key=None, value=None):
    """
    Connects to Redis and sets a key-value pair.
    
    Args:
        host (str): Redis server host
        port (int): Redis server port
        db (int): Redis database number
        key (str): The key to set (random if not provided)
        value (str): The value to set (random if not provided)
    """
    # Generate random key and value if not provided
    if key is None:
        key = generate_random_key()
    if value is None:
        value = generate_random_key()
    
    try:
        # Create a Redis client
        r = redis.Redis(host=host, port=port, db=db, decode_responses=True)
        
        # Set the key-value pair
        result = r.set(key, value)
        
        if result:
            print(f"Successfully set key '{key}' with value '{value}' in Redis")
            return True
        else:
            print(f"Failed to set key '{key}' in Redis")
            return False
            
    except redis.ConnectionError:
        print(f"Could not connect to Redis server at {host}:{port}")
        return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False

if __name__ == "__main__":
    # Default values
    REDIS_HOST = 'localhost'
    REDIS_PORT = 6379
    REDIS_DB = 0
    
    # Set a random key-value pair
    success = set_redis_key_value(
        host=REDIS_HOST,
        port=REDIS_PORT,
        db=REDIS_DB
    )
    
    if success:
        print("Redis operation completed successfully!")
    else:
        print("Redis operation failed!")
        sys.exit(1)