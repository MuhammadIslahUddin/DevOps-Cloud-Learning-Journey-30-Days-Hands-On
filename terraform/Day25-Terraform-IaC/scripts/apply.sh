#!/bin/bash
echo "🚀 Initializing Terraform..."
terraform init

echo "🧩 Planning..."
terraform plan

echo "✅ Applying configuration..."
terraform apply -auto-approve
