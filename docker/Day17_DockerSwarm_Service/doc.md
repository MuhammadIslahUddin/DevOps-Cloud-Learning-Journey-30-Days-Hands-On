# Day 17: Deploying My First Service in Docker Swarm

Today I deployed my first service using Docker Swarm.

### Key Commands:
- `docker swarm init` → initialize swarm manager
- `docker service create --name myweb -p 8082:5000 myapp:v2` → deploy service
- `docker service ls` → check services
- `docker service ps myweb` → see tasks/containers

### Output:
- Verified the service was created and running.
- Accessed app via `http://localhost:8082`.

This was my first hands-on experience of deploying an app as a Swarm service instead of just a container.
