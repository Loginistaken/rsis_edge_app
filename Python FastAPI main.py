from fastapi import FastAPI
from backend.database import conn, cursor
from backend.models import NodeSummary
from backend.crow_connector import process_hazard_tiles

app = FastAPI(title="RSIS Edge API")

@app.post("/api/node_summary")
async def node_summary(summary: NodeSummary):
    result = process_hazard_tiles(summary)
    return {"status": "ok", "hazard": result}

@app.get("/health")
async def health():
    return {"status": "online"}
