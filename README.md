# Azure Static Web App Infra (Bicep)

This repository contains the Infrastructure-as-Code (IaC) for deploying an Azure Static Web App with monitoring using Bicep.

## 🧱 Resources Deployed

- Azure Static Web App (Free Tier)
- Azure Application Insights (for monitoring)
- (Optional) Azure Function backend (can be added)

## 🚀 How to Deploy

### Prerequisites

- Azure CLI installed
- Logged in with `az login`
- Bicep CLI installed (or use `az bicep install`)

### Deployment Command

```bash
az deployment sub create \
  --location "East US" \
  --template-file main.bicep \
  --parameters parameters.json
