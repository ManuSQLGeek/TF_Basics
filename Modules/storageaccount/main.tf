provider "azurerm" {
  version = "=2.20.0"
  features {}
}

terraform {
  required_providers {
    azurerm = "~> 2.0"
  }
}

data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "example" {
  name                     = "${replace(lower(var.sql_server_name),"_","")}sa"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
