# Azure DNS via Terraform

## Usage
```bash
# 1) authenticate locally
az login
az account set --subscription SUBSCRIPTION_ID

# 2) init & plan
terraform init
terraform plan -var="zone_name=pipeline.fit"



# 2) If you want Terraform to **create** a fresh zone
From your repo root:
```bash
az login
az account set --subscription SUBSCRIPTION_ID

terraform init
terraform plan  -var="zone_name=pipeline.fit"
terraform apply -var="zone_name=pipeline.fit" -auto-approve

