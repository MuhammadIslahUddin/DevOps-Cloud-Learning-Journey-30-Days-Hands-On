#!/bin/bash
set -e

echo "🔹 Creating Docker network..."
docker network create mynetwork || echo "Network already exists"

echo "🔹 Starting Redis container..."
docker run -d --name redis --network mynetwork redis:7

echo "🔹 Building Python app image..."
docker build -t python-redis-app .

echo "🔹 Running Python app container..."
docker run --rm --network mynetwork python-redis-app
