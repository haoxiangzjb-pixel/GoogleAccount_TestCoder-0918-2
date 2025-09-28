from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.post("/data")
async def receive_data(item: dict):
    # Process the received data (example: just return it back)
    print(f"Received data: {item}")
    return {"received": item, "status": "success"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)