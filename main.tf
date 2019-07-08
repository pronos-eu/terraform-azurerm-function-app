resource "azurerm_resource_group" "function_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "function_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.function_resource_group.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  enable_blob_encryption   = "true"
  enable_file_encryption   = "true"
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "function_service_plan" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.function_resource_group.name
  kind                = "FunctionApp"
  tags                = var.tags

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

}

resource "azurerm_function_app" "function_app" {
  name                      = var.function_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.function_resource_group.name
  app_service_plan_id       = azurerm_app_service_plan.function_service_plan.id
  version                   = var.runtime_version
  https_only                = true
  client_affinity_enabled   = false
  storage_connection_string = azurerm_storage_account.function_storage_account.primary_connection_string
  app_settings              = var.app_settings
  tags                      = var.tags

  identity {
    type = "SystemAssigned"
  }

}
