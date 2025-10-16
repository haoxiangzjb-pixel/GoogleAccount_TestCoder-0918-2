from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional
import random
import string

app = FastAPI()

# Define a model for the request body
class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float

# Define the POST endpoint
@app.post("/items/")
async def create_item(item: Item):
    """
    Accepts a POST request with item data and returns the created item with an ID.
    """
    # Generate a random ID for the item
    item_id = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    
    # Return the created item with its ID
    return {
        "id": item_id,
        "name": item.name,
        "description": item.description,
        "price": item.price,
        "message": "Item created successfully"
    }

# Health check endpoint
@app.get("/")
async def root():
    return {"message": "FastAPI POST endpoint is running!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)