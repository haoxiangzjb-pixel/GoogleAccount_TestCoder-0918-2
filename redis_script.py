import redis
import random
import string

def generate_random_key():
    """Generates a random string key."""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def main():
    # Connect to Redis server
    # Assumes Redis is running locally on the default port
    try:
        r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)
        r.ping() # Check if the connection is successful
        print("Connected to Redis successfully.")
    except redis.ConnectionError:
        print("Error: Could not connect to Redis. Is the server running?")
        return

    # Generate a random key and set a value
    key = generate_random_key()
    value = "Hello, Redis!"

    print(f"Setting key: {key} with value: {value}")
    r.set(key, value)
    print("Key-value pair set.")

    # Verify by getting the value back
    retrieved_value = r.get(key)
    print(f"Retrieved value for key '{key}': {retrieved_value}")

if __name__ == "__main__":
    main()