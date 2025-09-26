import redis
import random
import string

try:
    # Connect to Redis server (assumes default localhost:6379)
    r = redis.Redis(decode_responses=True)

    # Generate a random key name
    random_key = ''.join(random.choices(string.ascii_letters + string.digits, k=10))

    # Set a key-value pair in Redis
    r.set(random_key, 'Hello from Python!')

    print(f"Set key '{random_key}' with value 'Hello from Python!' in Redis.")
except redis.exceptions.ConnectionError:
    print("Error: Could not connect to Redis server. Please ensure a Redis server is running on localhost:6379.")