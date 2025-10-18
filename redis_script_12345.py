import redis

# Connect to Redis (assumes Redis is running locally on default port 6379)
r = redis.Redis(host='localhost', port=6379, db=0, decode_responses=True)

# Set a key-value pair
key = "my_key"
value = "my_value"
r.set(key, value)

print(f"Set {key} = {value}")
print(f"Value of {key} is: {r.get(key)}")