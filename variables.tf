variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
}

variable "service_plan_name" {
  type        = string
  description = "Name of app service plan"
}

variable "function_name" {
  type        = string
  description = "Name of function app"
}

variable "storage_account_name" {
  type        = string
  description = "Name of storage account to create if enabled"
  default     = null
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = null
}

variable "enable_storage_creation" {
  type        = bool
  description = "If set to false, storage account will be not created and storage_connection_string variable is mandatory."
  default     = true
}

variable "enable_app_service_plan_creation" {
  type        = bool
  description = "If set to false, function app service plan will be not created and app_service_plan_id variable is mandatory."
  default     = true
}

variable "storage_connection_string" {
  type        = string
  description = "Storage account primary connection string if custom."
  default     = null
}

variable "app_service_plan_id" {
  type        = string
  description = "ID of app service plan where function app will be deployed/attached."
  default     = null
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

variable "runtime_version" {
  type        = string
  description = "Function runtime version"
  default     = "~2"
}

variable "worker_runtime" {
  type        = string
  description = "Functions worker runtime (e.g. node, python etc.)"
  default     = "node"
}

variable "app_settings" {
  type        = map(string)
  description = "Application settings to set on deploy."
  default     = {}
}

variable "kind" {
  type        = string
  description = "The kind of App Service Plan to create. Possible values: Windows (also available as App), Linux, elastic (Premium Consumption), FunctionApp (Consumption Plan)"
  default     = "FunctionApp"
}

variable "sku_tier" {
  type        = string
  description = "Pricing tier of function app plan"
  default     = "Dynamic"
}

variable "sku_size" {
  type        = string
  description = "Instance size of function app plan"
  default     = "Y1"
}

variable "node_version" {
  type        = string
  description = "Node.js version"
  default     = "10.15.2"
}

variable "use_32_bit_worker_process" {
  type        = bool
  description = "Determines if functions worker process should be running 32 bit or not. On Free or Shared plans must be set to true."
  default     = false
}

variable "always_on" {
  type        = bool
  description = "Determines if function app should be always loaded/running"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to assign to resources"
  default     = {}
}

variable "appinsights_instrumentationkey" {
  type        = string
  description = "Instrumentation key for app insights"
  default     = ""
}

variable "container_image" {
  type        = string
  description = "Instrumentation key for app insights"
  default     = "Container image name. Example: `innovationnorway/python-hello-world:latest`."
}

variable "docker_registry_url" {
  type        = string
  default     = "https://index.docker.io"
  description = "The container registry url."
}

variable "docker_registry_username" {
  type        = string
  default     = null
  description = "The container registry username."
}

variable "docker_registry_password" {
  type        = string
  default     = null
  description = "The container registry password."
}