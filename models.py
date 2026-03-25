from pydantic import BaseModel

class NodeSummary(BaseModel):
    pst_id: str
    speed: float
    acceleration: float
    heading: float
    nearby_density: int
