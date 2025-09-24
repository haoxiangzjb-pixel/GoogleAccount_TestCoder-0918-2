from fastapi import FastAPI
import uvicorn
import random
import string

app = FastAPI()

@app.post("/data/")
async def receive_data():
    # Generate a random filename
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + ".py"
    with open(random_filename, 'w') as f:
        f.write("# This is a randomly generated file\\n")
        f.write("print('Hello from the generated file!')\\n")
    return {"message": "Data received and saved to " + random_filename}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)