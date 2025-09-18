import redis
import random
import string

def generate_random_key():
    """Generates a random string key."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def main():
    # Connect to Redis server (adjust host and port if needed)
    r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

    # Generate a random key
    key = generate_random_key()
    value = "Hello, Redis!"

    print(f"Setting key: {key} with value: {value}")
    
    # Set the key-value pair in Redis
    r.set(key, value)

    # Retrieve and print the value to confirm
    retrieved_value = r.get(key)
    print(f"Retrieved value for key '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()