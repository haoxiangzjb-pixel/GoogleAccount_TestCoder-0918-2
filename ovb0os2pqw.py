import redis
import random
import string

# Generate a random key and value for demonstration
random_key = 'key_' + ''.join(random.choices(string.ascii_letters + string.digits, k=8))
random_value = 'value_' + ''.join(random.choices(string.ascii_letters + string.digits, k=10))

# Connect to Redis (assuming default localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    # Set the key-value pair in Redis
    r.set(random_key, random_value)
    print(f"Set key '{random_key}' with value '{random_value}' in Redis")
    
    # Verify the value was set
    retrieved_value = r.get(random_key)
    print(f"Retrieved value for '{random_key}': {retrieved_value}")
    
except redis.ConnectionError:
    print("Could not connect to Redis server. Please make sure Redis is running.")
except Exception as e:
    print(f"An error occurred: {e}")