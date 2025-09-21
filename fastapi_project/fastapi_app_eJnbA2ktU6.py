from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict, Any
import json
import os

# Initialize FastAPI app
app = FastAPI(title="Sample API", description="A simple FastAPI application with a POST endpoint")

# Model for our POST request
class DataModel(BaseModel):
    name: str
    age: int
    email: str
    additional_data: Dict[str, Any] = None

# In-memory storage for demonstration
data_storage = []

# POST endpoint
@app.post("/submit-data/", response_model=Dict[str, Any])
async def submit_data(data: DataModel):
    """
    Accepts a POST request with name, age, and email.
    Stores the data and returns a confirmation.
    """
    # Convert to dict and add to storage
    stored_data = data.dict()
    stored_data["id"] = len(data_storage) + 1
    data_storage.append(stored_data)
    
    return {
        "message": "Data received successfully",
        "data": stored_data
    }

# GET endpoint to retrieve all data (for testing purposes)
@app.get("/get-all-data/")
async def get_all_data():
    """
    Returns all submitted data.
    """
    return {"all_data": data_storage}

# Health check endpoint
@app.get("/health/")
async def health_check():
    """
    Simple health check endpoint.
    """
    return {"status": "OK"}

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)