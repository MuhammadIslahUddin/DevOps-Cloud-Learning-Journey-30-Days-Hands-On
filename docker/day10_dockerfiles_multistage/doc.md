# Day 10: Dockerfiles & Multi-Stage Builds

## 🔹 Recap of Dockerfile Basics
- **FROM** → base image  
- **RUN** → execute commands in the image  
- **COPY / ADD** → add files from local to image  
- **WORKDIR** → set working directory  
- **CMD / ENTRYPOINT** → default command to run  
- **EXPOSE** → document ports  

### Best Practices:
- Use smaller base images (e.g., `alpine`)
- Combine `RUN` commands to reduce layers
- Use `.dockerignore` to skip unnecessary files

---

## 🔹 Useful Instructions
- **ENV** → set environment variables  
- **VOLUME** → define persistent storage locations  
- **HEALTHCHECK** → monitor container health  

---

## 🔹 Multi-Stage Builds
- Helps keep images small and optimized  
- Build dependencies in one stage, copy only required artifacts to final stage  

Example:
```dockerfile
# First stage: build
FROM golang:1.20 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

# Second stage: runtime
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/myapp .
CMD ["./myapp"]
