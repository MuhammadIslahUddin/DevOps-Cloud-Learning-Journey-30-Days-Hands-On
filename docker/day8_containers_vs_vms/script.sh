#!/bin/bash
echo "=== Starting Containers vs VMs Demo ==="

echo -e "\n[1] Running a lightweight container (nginx:alpine)..."
docker run -d --name nginx_demo -p 8080:80 nginx:alpine

echo -e "\n[2] Checking container resource usage..."
docker stats --no-stream nginx_demo

echo -e "\n[3] Checking system resource usage (simulating VM overhead)..."
top -b -n 1 | head -n 10

echo -e "\n[4] Cleaning up..."
docker stop nginx_demo && docker rm nginx_demo

echo "=== Demo Completed ==="
