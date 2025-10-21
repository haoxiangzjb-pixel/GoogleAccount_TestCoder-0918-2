from fastapi import FastAPI
import uvicorn
import random
import string

# Create a random filename for this endpoint file
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"/workspace/{random_name}.py"

# Create FastAPI app
app = FastAPI()

@app.post("/data")
async def create_item(data: dict):
    """
    A POST endpoint that accepts JSON data and returns a confirmation
    """
    # Process the received data
    processed_data = {
        "received_data": data,
        "status": "success",
        "message": "Data received successfully"
    }
    
    return processed_data

@app.post("/users")
async def create_user(name: str, email: str):
    """
    A POST endpoint that creates a new user
    """
    user = {
        "id": random.randint(1, 1000),
        "name": name,
        "email": email
    }
    
    return {"user": user, "status": "created"}

# Run the server if this file is executed directly
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)