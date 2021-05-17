provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "devops_rg" {
  name     = "devops_rg"
  location = var.location
}

