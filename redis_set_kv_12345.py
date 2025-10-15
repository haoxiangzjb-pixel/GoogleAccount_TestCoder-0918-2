#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
"""

import redis
import sys

def set_redis_key_value(host='localhost', port=6379, db=0, key='my_key', value='my_value'):
    """
    Connects to Redis and sets a key-value pair.
    
    Args:
        host (str): Redis server host
        port (int): Redis server port
        db (int): Redis database number
        key (str): The key to set
        value (str): The value to set
    """
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
    KEY = 'example_key'
    VALUE = 'example_value'
    
    # You can customize these values
    success = set_redis_key_value(
        host=REDIS_HOST,
        port=REDIS_PORT,
        db=REDIS_DB,
        key=KEY,
        value=VALUE
    )
    
    if success:
        print("Redis operation completed successfully!")
    else:
        print("Redis operation failed!")
        sys.exit(1)