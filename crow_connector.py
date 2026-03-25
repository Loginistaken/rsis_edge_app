import requests

def process_hazard_tiles(summary):
    payload = {
        "pst_id": summary.pst_id,
        "speed": summary.speed,
        "acceleration": summary.acceleration,
        "heading": summary.heading,
        "density": summary.nearby_density
    }
    response = requests.post("http://crow:9000/compute", json=payload)
    return response.json()
