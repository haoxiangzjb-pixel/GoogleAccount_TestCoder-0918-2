#!/usr/bin/env python3
"""
A simple Python script to connect to Redis and set a key-value pair.

Note: This script requires:
1. The Python 'redis' library (pip install redis)
2. A running Redis server (typically on localhost:6379)

If Redis server is not installed, you can install it with:
- Ubuntu/Debian: sudo apt install redis-server
- CentOS/RHEL: sudo yum install redis
- macOS: brew install redis
"""

import redis
import random
import string

def generate_random_key():
    """Generate a random key for our Redis example."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def main():
    # Connect to Redis (assuming it's running on localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Generate a random key and value
        key = generate_random_key()
        value = "Hello, Redis!"
        
        # Set the key-value pair
        r.set(key, value)
        print(f"Set key '{key}' with value '{value}'")
        
        # Verify by getting the value
        retrieved_value = r.get(key)
        print(f"Retrieved value for key '{key}': {retrieved_value}")
        
    except redis.ConnectionError:
        print("Error: Could not connect to Redis. Please ensure Redis is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()