# Day 13: Docker Volumes & Persistent Storage

## Why Volumes?
Containers are ephemeral. When they are deleted, all data inside is lost.  
Volumes allow data persistence beyond container lifecycle.

---

## Types of Volumes
1. **Anonymous**  
   Created automatically when using `-v /container/path`.

2. **Named**  
   User-defined volumes (recommended).
   ```bash
   docker volume create mydata
   docker run -d -v mydata:/data redis
