#!/usr/bin/env python3
"""
A Python script that connects to Redis and sets a key-value pair.
"""

import redis
import random
import string

def generate_random_value(length=10):
    """Generate a random string of specified length."""
    letters = string.ascii_letters + string.digits
    return ''.join(random.choice(letters) for _ in range(length))

def main():
    # Connect to Redis server (default: localhost:6379)
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
    except redis.ConnectionError:
        print("Could not connect to Redis server. Please make sure Redis is running.")
        return
    
    # Generate a random key and value
    random_key = "random_key_" + generate_random_value(8)
    random_value = "random_value_" + generate_random_value(12)
    
    # Set the key-value pair in Redis
    r.set(random_key, random_value)
    print(f"Set key '{random_key}' with value '{random_value}' in Redis")
    
    # Verify the key-value pair was set
    retrieved_value = r.get(random_key)
    print(f"Retrieved value for key '{random_key}': {retrieved_value}")
    
    # Optionally, set an expiration time (TTL) for the key (e.g., 3600 seconds = 1 hour)
    r.expire(random_key, 3600)
    print(f"Set expiration time of 1 hour for key '{random_key}'")

if __name__ == "__main__":
    main()