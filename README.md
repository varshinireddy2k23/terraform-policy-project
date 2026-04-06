# Terraform Policy as Code with OPA & GitHub Actions

## 📌 Project Overview
This project demonstrates how to enforce security policies on Terraform infrastructure using Open Policy Agent (OPA) integrated with GitHub Actions.

## 🚀 Features
- Infrastructure as Code using Terraform
- Policy as Code using OPA (Conftest)
- CI/CD pipeline using GitHub Actions
- Automated policy validation before deployment
- Branch protection for secure merging

## 🛠️ Tools Used
- Terraform
- Open Policy Agent (OPA)
- Conftest
- GitHub Actions
- AWS S3

## 🔐 Policy Enforcement
The policy ensures:
- S3 buckets must have server-side encryption enabled

## ⚙️ Workflow
1. Developer pushes code
2. GitHub Actions triggers
3. Terraform plan is generated
4. Plan converted to JSON
5. OPA policy check runs
6. Pipeline fails if policy violated

## 📂 Project Structure
