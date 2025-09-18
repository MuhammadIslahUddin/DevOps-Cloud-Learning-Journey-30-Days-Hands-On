#!/bin/bash

set -e

# Step 1: Pull Nginx image
echo "Pulling Nginx image..."
docker pull nginx

# Step 2: Run Nginx container
echo "Running Nginx container on port 8080..."
docker run -d -p 8080:80 --name nginx-container nginx

# Step 3: Build custom image from Dockerfile
echo "Building custom image..."
docker build -t my-custom-image .

# Step 4: Run custom image
echo "Running custom image..."
docker run my-custom-image

# Step 5: Tag custom image for Docker Hub
DOCKER_USERNAME="your-dockerhub-username"
echo "Tagging custom image..."
docker tag my-custom-image $DOCKER_USERNAME/my-custom-image:v1

# Step 6: Push image to Docker Hub
echo "Pushing image to Docker Hub..."
docker push $DOCKER_USERNAME/my-custom-image:v1

echo "✅ Day 9 task completed successfully!"
