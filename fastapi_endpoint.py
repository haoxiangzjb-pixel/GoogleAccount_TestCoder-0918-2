from fastapi import FastAPI
import uuid
import os

app = FastAPI()

@app.post("/data/")
async def receive_data(item: dict):
    # Generate a random filename using uuid
    random_filename = f"{uuid.uuid4()}.py"
    
    # Write the received data to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(str(item))
    
    return {"message": "Data saved successfully", "filename": random_filename}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)