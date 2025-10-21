from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/")
async def handle_post_request(data: dict):
    "Accepts a POST request and processes the data"
    return {
        "message": "POST request received successfully",
        "received_data": data,
        "status": "success"
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
