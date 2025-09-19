# Day 11: Docker Networking & Container Communication

## 🔹 Default Docker Networks
- **bridge** (default): containers get their own IP and can communicate if on the same bridge  
- **host**: container shares the host machine’s network stack  
- **none**: no network connectivity  

Check networks:
```bash
docker network ls
