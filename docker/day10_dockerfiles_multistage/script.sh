#!/bin/bash
set -e

echo "🚀 Building multi-stage Python Docker image..."
docker build -t multi-stage-python:latest .

echo "✅ Running container..."
docker run --rm multi-stage-python:latest
