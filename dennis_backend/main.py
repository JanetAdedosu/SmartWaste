from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Smart Waste Backend is running 🚀"}
