from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_post_data():
    return {"message": "POST request received successfully!"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)