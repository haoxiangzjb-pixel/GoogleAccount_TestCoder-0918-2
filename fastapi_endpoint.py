from fastapi import FastAPI
import uuid
import os

app = FastAPI()

@app.post("/data")
async def receive_data(data: dict):
    # Generate a random filename
    random_filename = f"endpoint_{uuid.uuid4().hex}.py"
    
    # Save the received data to the randomly named file
    with open(random_filename, "w") as f:
        f.write(str(data))
    
    return {"message": f"Data saved successfully to {random_filename}", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)