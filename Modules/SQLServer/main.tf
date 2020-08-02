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

resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = data.azurerm_resource_group.example.name
  location                     = data.azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.SQL_Login
  administrator_login_password = var.SQL_Password

  tags = var.tags
}
