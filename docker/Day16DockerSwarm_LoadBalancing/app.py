# simple Flask app (v2) — shows different text so we can observe rolling update
from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def hello():
    return f"🚀 Hello from v2 — served by {socket.gethostname()}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
