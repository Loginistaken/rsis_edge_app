# synthetic_nodes/generate.py
import random, time
from backend.crow_connector import process_hazard_tiles

for i in range(1000):
    summary = {
        "pst_id": f"node_{i}",
        "speed": random.uniform(0, 30),
        "acceleration": random.uniform(-2, 2),
        "heading": random.uniform(0, 360),
        "nearby_density": random.randint(0, 10)
    }
    hazard = process_hazard_tiles(summary)
    print(hazard)
    time.sleep(0.01)
