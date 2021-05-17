# resource "azurerm_storage_account" "maddydevops" {
#   name                     = "maddydevops"
#   resource_group_name      = azurerm_resource_group.devops_rg.name
#   location                 = azurerm_resource_group.devops_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "Production"
#   }
# }

# # resource "azurerm_storage_container" "Devops_Storage_Container" {
# #   name                  = "vhds"
# #   storage_account_name  = azurerm_storage_account.maddydevops.name
# #   container_access_type = "private"
# # }

# resource "azurerm_storage_container" "my-data-script" {
#   name                  = "content"
#   storage_account_name  = azurerm_storage_account.maddydevops.name
#   container_access_type = "private"
# }

# resource "azurerm_storage_blob" "my-blob" {
#   name                   = "custom_script.sh"
#   storage_account_name   = azurerm_storage_account.maddydevops.name
#   storage_container_name = azurerm_storage_container.my-data-script.name
#   type                   = "Block"
#   source                 = "script.sh"
# }
