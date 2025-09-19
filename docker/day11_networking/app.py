import redis

print("🚀 Python app started...")

try:
    client = redis.Redis(host="redis", port=6379)
    client.set("day11", "Docker Networking Works!")
    value = client.get("day11").decode("utf-8")
    print("✅ Retrieved from Redis:", value)
except Exception as e:
    print("❌ Error connecting to Redis:", str(e))
