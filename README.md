# Azure DNS via Terraform

Manage an Azure DNS zone and records.  
Run **locally** with `dev.tfvars`. Deploy in **GitHub Actions** via **OIDC** (no secrets).

---

## 1) Run locally with `dev.tfvars`

### Prereqs
- Azure CLI + Terraform installed
- Azure subscription & a DNS Resource Group (e.g. `example-dns`)
- (Optional but recommended) Remote state in Azure Storage

### Create `dev.tfvars`
```hcl
# DNS / infra
subscription_id      = "dededededede"
zone_name            = "example.com"
dns_rg_name          = "example-dns"
location             = "westeurope"

# Example records (adjust/remove if not used)
app_ip               = "10.10.10.10"
app_cname            = "mywebapp.azurewebsites.net."
app_txt              = "dededededededede"
storage_account_name = "sttfstate12345"
```

---

## 2) If you want Terraform to **create** a fresh zone

From your repo root:

```bash
az login
az account set --subscription SUBSCRIPTION_ID

terraform init
terraform plan  -var="zone_name=example.com"
terraform apply -var="zone_name=example.com" -auto-approve
```
