#!/usr/bin/env python3

import redis
import random
import string

def generate_random_string(length=10):
    """Generate a random string of ASCII characters."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(length))

def main():
    # Connect to Redis
    # Assuming Redis is running on localhost with default port 6379
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        
        # Test the connection
        r.ping()
        print("Connected to Redis successfully!")
        
        # Generate a random key and value
        key = f"key_{generate_random_string(5)}"
        value = f"value_{generate_random_string(8)}"
        
        # Set the key-value pair in Redis
        r.set(key, value)
        print(f"Set {key} = {value}")
        
        # Verify by getting the value back
        retrieved_value = r.get(key)
        print(f"Retrieved {key} = {retrieved_value}")
        
        # Let's set a few more examples
        r.set("user:1000:name", "Alice")
        r.set("user:1000:email", "alice@example.com")
        r.set("counter:page_views", 100)
        
        print("\nAdditional key-value pairs set:")
        print(f"user:1000:name = {r.get('user:1000:name')}")
        print(f"user:1000:email = {r.get('user:1000:email')}")
        print(f"counter:page_views = {r.get('counter:page_views')}")
        
    except redis.ConnectionError:
        print("Error: Unable to connect to Redis. Please ensure Redis server is running.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    main()