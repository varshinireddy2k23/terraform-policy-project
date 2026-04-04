#!/bin/bash

echo "Running Terraform Plan..."
terraform plan -out=tfplan

echo "Converting plan to JSON..."
terraform show -json tfplan > tfplan.json

echo "Running Policy Check..."
conftest test tfplan.json --policy .

# Check result
if [ $? -ne 0 ]; then
  echo "❌ Policy violations found. Aborting."
  exit 1
fi

echo "✅ All policies passed."
