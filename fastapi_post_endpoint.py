from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import uvicorn
import json
import random
import string

app = FastAPI()

class PostData(BaseModel):
    name: str
    age: int
    email: str

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_chars}.py"

@app.post("/submit_data/")
async def submit_data(data: PostData):
    """Endpoint that accepts POST request and saves data to a random .py file"""
    try:
        # Generate random filename
        filename = generate_random_filename()
        
        # Save data to the file
        with open(filename, "w") as file:
            file.write("# POST data saved\n")
            file.write(f"data = {json.dumps(data.dict(), indent=2)}\n")
        
        return {
            "message": "Data saved successfully",
            "filename": filename
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)