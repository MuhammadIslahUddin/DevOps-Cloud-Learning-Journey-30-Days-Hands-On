# Day 9 – Docker Images & Docker Hub

---

## 1. Docker Images
- A **Docker image** is a lightweight, stand-alone, and immutable file that contains everything needed to run an application:
  - Code
  - Runtime
  - Libraries
  - Environment variables
  - Configuration files
- Images are created from **Dockerfiles** and stored in a layered format for efficiency.

---

## 2. Images vs Containers
- **Image** → Blueprint (static, read-only, cannot be changed).  
- **Container** → Running instance of an image (dynamic, isolated).  

---

## 3. Docker Hub
- A cloud-based registry for storing and sharing Docker images.
- Types of repositories:
  - **Public Repo** → Anyone can pull.
  - **Private Repo** → Access restricted to specific users.

---

## 4. Common Commands

### Pull an image
```bash
docker pull nginx
