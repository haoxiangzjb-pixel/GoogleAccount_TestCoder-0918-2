import redis
import uuid

# Generate a random key-value pair
random_key = f"random_key_{uuid.uuid4().hex[:8]}"
random_value = f"random_value_{uuid.uuid4().hex}"

# Connect to Redis (assuming default localhost:6379)
try:
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
    
    # Set the key-value pair in Redis
    r.set(random_key, random_value)
    
    print(f"Successfully set key '{random_key}' with value '{random_value}' in Redis")
    
    # Verify the value was set
    retrieved_value = r.get(random_key)
    print(f"Retrieved value for '{random_key}': {retrieved_value}")
    
except redis.ConnectionError:
    print("Could not connect to Redis. Please make sure Redis server is running.")
except Exception as e:
    print(f"An error occurred: {e}")