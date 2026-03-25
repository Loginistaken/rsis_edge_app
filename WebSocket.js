const ws = new WebSocket("wss://yourdomain.com/ws/dashboard");
ws.onmessage = (event) => updateMap(JSON.parse(event.data).tiles);
