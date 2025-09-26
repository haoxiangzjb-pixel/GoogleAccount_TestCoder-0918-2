from fastapi import FastAPI
import uvicorn
import uuid

app = FastAPI()

@app.post("/data/")
async def receive_post(request_data: dict):
    """
    Accepts a POST request with arbitrary JSON data.
    Returns a success message with a unique ID for the request.
    """
    request_id = str(uuid.uuid4())
    print(f"Received POST data (ID: {request_id}): {request_data}")
    # Here you would typically process the data, save it to a DB, etc.
    return {"message": "Data received successfully", "request_id": request_id}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
