output "dns_zone_id" {
  value = azurerm_dns_zone.pipeline.id
}

output "name_servers" {
  description = "NS you must set at the domain registrar"
  value       = azurerm_dns_zone.pipeline.name_servers
}
