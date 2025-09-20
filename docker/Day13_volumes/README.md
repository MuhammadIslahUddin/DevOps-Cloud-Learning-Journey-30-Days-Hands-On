### Day 13: Docker Volumes & Persistent Storage
- Learned how to persist data across container restarts.
- Explored **anonymous**, **named**, and **bind mount** volumes.
- Used Docker Compose to mount a persistent Redis data volume.
- Python app now increments a Redis counter and logs to a file that persists.
- Practice: Added host-mounted `logs/` directory to ensure logs survive restarts.
