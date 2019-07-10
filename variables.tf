variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
  default     = "function-app-resource-group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "northeurope"
}

variable "function_name" {
  type        = string
  description = "Name of function app"
  default     = "super-nice-function"
}

variable "enable_storage_creation" {
  description = "If set to false, storage account will be not created and storage_connection_string variable is mandatory."
  type        = bool
  default     = true
}

variable "storage_connection_string" {
  type        = string
  description = "Storage account primary connection string if custom."
  default     = null
}

variable "storage_account_name" {
  type        = string
  description = "Name of storage account to create if enabled"
  default     = "fncstrgaccnt"
}

variable "account_tier" {
  type        = string
  description = "Storage account tier"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Type of Storage Account replication."
  default     = "LRS"
}

variable "service_plan_name" {
  type        = string
  description = "Name of app service plan"
  default     = "function-app-service-plan"
}

variable "runtime_version" {
  type        = string
  description = "Function runtime version"
  default     = "~1"
}

variable "app_settings" {
  type        = map
  description = "Application settings to set on deploy."
  default     = {}
}


variable "tags" {
  description = "Map of tags to assign to resources"
  type        = "map"
  default     = {}
}
