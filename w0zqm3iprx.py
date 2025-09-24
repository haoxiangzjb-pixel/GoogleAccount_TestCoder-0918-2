from fastapi import FastAPI

app = FastAPI()

@app.post("/data/")
async def receive_data(item: dict):
    # Process the received data here
    print(f"Received data: {item}")
    return {"message": "Data received successfully", "received_item": item}
