# Day 12: Docker Compose – Multi-Container Applications

## 🔹 What is Docker Compose?
Docker Compose is a tool for defining and running multi-container Docker applications.  
It uses a simple YAML file (`docker-compose.yml`) to configure services, networks, and volumes.

## 🔹 Why use it?
- Define multi-container apps in one file
- Start all services with `docker-compose up`
- Manage networking automatically
- Easy scaling (`docker-compose up --scale`)

---

## 🔹 Example Setup (Python + Redis)

We’ll run:
1. A **Redis service**
2. A **Python app** that connects to Redis

---

## 📜 Commands
- `docker-compose up -d` → start services  
- `docker-compose ps` → list running services  
- `docker-compose logs -f` → follow logs  
- `docker-compose down` → stop and clean up  

---

## 📸 Demo Screenshot
(see screenshot.png for output)
