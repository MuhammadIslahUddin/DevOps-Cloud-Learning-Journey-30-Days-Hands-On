import redis
import time
import os

# Redis connection
r = redis.Redis(host="redis", port=6379)

# Ensure logs directory exists
os.makedirs("/app/logs", exist_ok=True)
log_file = "/app/logs/app.log"

while True:
    counter = r.incr("hits")
    message = f"Page visited {counter} times."
    print(message)

    # Append to log file
    with open(log_file, "a") as f:
        f.write(message + "\n")

    time.sleep(2)
