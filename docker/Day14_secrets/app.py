import redis

# Read secret from file
with open("/run/secrets/redis_password", "r") as f:
    password = f.read().strip()

r = redis.Redis(host="redis", port=6379, password=password)

# Test connection
r.set("secure_key", "HelloSecureWorld")
print("Stored:", r.get("secure_key").decode())
