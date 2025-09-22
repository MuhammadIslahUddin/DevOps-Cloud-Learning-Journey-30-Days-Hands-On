# Day 15 – Docker Swarm Basics

## What is Docker Swarm?
Docker Swarm is Docker’s built-in container orchestration tool. It allows you to run a cluster of Docker nodes as a single virtual system.

### Key Concepts
- **Manager Node**: Controls and manages the swarm.
- **Worker Node**: Runs tasks (containers).
- **Service**: The definition of how containers should run (image, replicas, ports).
- **Task**: A single container instance of a service.
- **Overlay Network**: Virtual network that spans across all nodes.

### Commands to Know
- Initialize swarm:
  ```bash
  docker swarm init
