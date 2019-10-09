# terraform-azurerm-function-consumption

# Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| function\_name | Name of function app | string | n/a | yes |
| resource\_group\_name | Name of resource group | string | n/a | yes |
| service\_plan\_name | Name of app service plan | string | n/a | yes |
| account\_replication\_type | Type of Storage Account replication. | string | `"LRS"` | no |
| account\_tier | Storage account tier | string | `"Standard"` | no |
| always\_on | Determines if function app should be always loaded/running | bool | `"false"` | no |
| app\_service\_plan\_id | ID of app service plan where function app will be deployed/attached. | string | `"null"` | no |
| app\_settings | Application settings to set on deploy. | map(string) | `{}` | no |
| appinsights\_instrumentationkey | Instrumentation key for app insights | string | `""` | no |
| enable\_app\_service\_plan\_creation | If set to false, function app service plan will be not created and app\_service\_plan\_id variable is mandatory. | bool | `"true"` | no |
| enable\_storage\_creation | If set to false, storage account will be not created and storage\_connection\_string variable is mandatory. | bool | `"true"` | no |
| kind | The kind of App Service Plan to create. Possible values: Windows \(also available as App\), Linux, elastic \(Premium Consumption\), FunctionApp \(Consumption Plan\) | string | `"FunctionApp"` | no |
| location | Azure region where resources will be created | string | `"null"` | no |
| node\_version | Node.js version | string | `"10.15.2"` | no |
| runtime\_version | Function runtime version | string | `"~2"` | no |
| sku\_size | Instance size of function app plan | string | `"Y1"` | no |
| sku\_tier | Pricing tier of function app plan | string | `"Dynamic"` | no |
| storage\_account\_name | Name of storage account to create if enabled | string | `"null"` | no |
| storage\_connection\_string | Storage account primary connection string if custom. | string | `"null"` | no |
| tags | Map of tags to assign to resources | map(string) | `{}` | no |
| use\_32\_bit\_worker\_process | Determines if functions worker process should be running 32 bit or not. On Free or Shared plans must be set to true. | bool | `"true"` | no |
| worker\_runtime | Functions worker runtime \(e.g. node, python etc.\) | string | `"node"` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_service\_plan\_id | ID of app service plan used by functions |
| function\_app\_default\_hostname | Function App Default Hostname |
| function\_app\_id | Function App unique ID |
| function\_app\_outbound\_ip\_addresses | Function App outbound IP Addresses |
| function\_app\_possible\_outbound\_ip\_addresses | All possible Function App outbound IP Addresses |
| function\_app\_site\_credential | Site-level credentials, can be used to publish code |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
