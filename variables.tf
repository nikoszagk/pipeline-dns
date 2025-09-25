variable "dns_rg_name" {
  description = "Resource Group to host the DNS zone"
  type        = string
}

variable "location" {
  description = "Location for the resource group (DNS is global, RG still needs a region)"
  type        = string
}

variable "zone_name" {
  description = "DNS zone (root domain)"
  type        = string
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription to deploy into"
}

variable "storage_account_name" {
  description = "Resource Group to host the DNS zone"
  type        = string
}

variable "app_ip" {
  description = "The public IP address of the app service"
  type        = string
}

variable "app_cname" {
  description = "The CNAME target for www (App Service default hostname)"
  type        = string
}

variable "app_txt" {
  description = "The CNAME target for www (App Service default hostname)"
  type        = string
}