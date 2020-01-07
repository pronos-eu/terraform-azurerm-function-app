output "function_app_id" {
  description = "Function App unique ID"
  value       = azurerm_function_app.main.id
}

output "function_app_default_hostname" {
  description = "Function App Default Hostname"
  value       = azurerm_function_app.main.default_hostname
}

output "function_app_outbound_ip_addresses" {
  description = "Function App outbound IP Addresses"
  value       = azurerm_function_app.main.outbound_ip_addresses
}

output "function_app_possible_outbound_ip_addresses" {
  description = "All possible Function App outbound IP Addresses"
  value       = azurerm_function_app.main.possible_outbound_ip_addresses
}

output "function_app_site_credential" {
  description = "Site-level credentials, can be used to publish code"
  sensitive   = true
  value       = azurerm_function_app.main.site_credential
}

output "app_service_plan_id" {
  description = "ID of app service plan used by functions"
  value       = var.enable_app_service_plan_creation ? azurerm_app_service_plan.main[0].id : var.app_service_plan_id
}

output "resource_group_name" {
  description = "Name of resource group where function are deployed"
  value       = data.azurerm_resource_group.main.name
}
