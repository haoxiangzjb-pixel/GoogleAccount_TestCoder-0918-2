#!/usr/bin/env python3
"""
Redis Key-Value Setter Script
Sets a key-value pair in Redis.
"""

import redis

def set_redis_key_value(host='localhost', port=6379, db=0):
    """
    Connect to Redis and set a key-value pair.
    
    Args:
        host: Redis server hostname (default: localhost)
        port: Redis server port (default: 6379)
        db: Redis database number (default: 0)
    """
    # Connect to Redis
    r = redis.Redis(host=host, port=port, db=db)
    
    # Set key-value pair
    key = "my_key"
    value = "my_value"
    
    try:
        r.set(key, value)
        print(f"Successfully set '{key}' = '{value}' in Redis")
        
        # Verify the value was set
        retrieved_value = r.get(key)
        if retrieved_value:
            print(f"Verified: Retrieved value = '{retrieved_value.decode()}'")
        else:
            print("Warning: Could not retrieve the value after setting")
            
    except redis.ConnectionError as e:
        print(f"Error connecting to Redis: {e}")
        raise
    except Exception as e:
        print(f"Error setting key-value: {e}")
        raise

if __name__ == "__main__":
    set_redis_key_value()
