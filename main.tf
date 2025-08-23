terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }

  # save into remote state
  backend "azurerm" {
    resource_group_name  = "pipeline-dns"
    storage_account_name = "sttfstate28663" 
    container_name       = "tfstate"
    key                  = "dns/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_provider_registration" "azureterraform" {
  name = "Microsoft.AzureTerraform"
}

# Create (or reference) a resource group for DNS
resource "azurerm_resource_group" "dns" {
  name     = var.dns_rg_name
  location = var.location
}

# Azure DNS Zone
resource "azurerm_dns_zone" "pipeline" {
  name                = var.zone_name
  resource_group_name = azurerm_resource_group.dns.name
}
