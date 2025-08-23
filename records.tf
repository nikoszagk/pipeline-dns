resource "azurerm_dns_a_record" "root_name" {
  name                = "@"
  zone_name           = azurerm_dns_zone.pipeline.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 600
  records             = [var.app_ip]
}

resource "azurerm_dns_cname_record" "www_cname" {
  name                = "www"
  zone_name           = azurerm_dns_zone.pipeline.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 600
  record              = var.app_cname
}


# Example TXT (SPF, verification, etc.)
resource "azurerm_dns_txt_record" "txt_asuid" {
  name                = "asuid"
  zone_name           = azurerm_dns_zone.pipeline.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 600
  record {
    value = var.app_txt
  }
 }

 resource "azurerm_dns_txt_record" "txt_asuid_www" {
  name                = "asuid.www"
  zone_name           = azurerm_dns_zone.pipeline.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 600
  record {
    value = var.app_txt
  }
 }
