locals {
  default_app_settings = {
    FUNCTIONS_EXTENSION_VERSION     = var.runtime_version
    WEBSITE_NODE_DEFAULT_VERSION    = var.node_version
    APPINSIGHTS_INSTRUMENTATIONKEY  = var.appinsights_instrumentationkey
    DOCKER_REGISTRY_SERVER_URL      = var.docker_registry_url
    DOCKER_REGISTRY_SERVER_USERNAME = var.docker_registry_username
    DOCKER_REGISTRY_SERVER_PASSWORD = var.docker_registry_password
    DOCKER_CUSTOM_IMAGE_NAME        = var.container_image
  }
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "main" {
  count                    = var.enable_storage_creation ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = coalesce(var.location, data.azurerm_resource_group.main.location)
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  enable_blob_encryption   = "true"
  enable_file_encryption   = "true"
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "main" {
  count               = var.enable_app_service_plan_creation ? 1 : 0
  name                = var.service_plan_name
  location            = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name = data.azurerm_resource_group.main.name
  kind                = var.kind
  reserved            = lower(var.kind) == "linux" ? true : false
  tags                = var.tags

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_function_app" "main" {
  name                      = var.function_name
  location                  = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name       = data.azurerm_resource_group.main.name
  app_service_plan_id       = var.enable_app_service_plan_creation ? azurerm_app_service_plan.main[0].id : var.app_service_plan_id
  version                   = var.runtime_version
  https_only                = true
  client_affinity_enabled   = false
  app_settings              = merge(local.default_app_settings, var.app_settings)
  storage_connection_string = var.enable_storage_creation ? azurerm_storage_account.main[0].primary_connection_string : var.storage_connection_string
  tags                      = var.tags

  site_config {
    always_on                 = lower(var.sku_tier) == "free" || lower(var.sku_tier) == "dynamic" ? false : var.always_on
    use_32_bit_worker_process = lower(var.sku_tier) == "free" || lower(var.sku_tier) == "dynamic" ? true : var.use_32_bit_worker_process
    linux_fx_version          = "DOCKER|${var.docker_registry_url}/${var.container_image}"
  }

  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [app_settings.FUNCTIONS_EXTENSION_VERSION]
  }
}
