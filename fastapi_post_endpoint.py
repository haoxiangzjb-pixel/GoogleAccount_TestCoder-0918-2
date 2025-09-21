from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict, Any
import json
import uuid

app = FastAPI()

# Model for the data we'll accept in our POST request
class Item(BaseModel):
    name: str
    description: str
    price: float
    tax: float = None

# Simple in-memory storage
items_db: Dict[str, Any] = {}

@app.post("/items/")
async def create_item(item: Item):
    """
    Create a new item with the provided data.
    Returns the created item with its ID.
    """
    # Generate a unique ID for the item
    item_id = str(uuid.uuid4())
    
    # Convert the Pydantic model to a dictionary and add the ID
    item_dict = item.dict()
    item_dict["id"] = item_id
    
    # Store the item in our "database"
    items_db[item_id] = item_dict
    
    return {"message": "Item created successfully", "item": item_dict}

@app.get("/items/{item_id}")
async def get_item(item_id: str):
    """
    Retrieve an item by its ID.
    """
    if item_id not in items_db:
        raise HTTPException(status_code=404, detail="Item not found")
    
    return {"item": items_db[item_id]}

@app.get("/")
async def root():
    """
    Root endpoint with a simple message.
    """
    return {"message": "Welcome to the FastAPI POST endpoint example!"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)