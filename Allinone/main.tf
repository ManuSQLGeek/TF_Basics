provider "azurerm" {
  version = "=2.20.0"
  features {}
}

terraform {
  required_providers {
    azurerm = "~> 2.0"
  }
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.SQL_Login
  administrator_login_password = var.SQL_Password

  tags = var.tags
}

resource "azurerm_storage_account" "example" {
  name                     = "${replace(lower(var.sql_server_name),"_","")}sa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_db_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  server_name         = azurerm_sql_server.example.name
  edition             = var.sql_db_edition
  requested_service_objective_name = var.requested_service_objective_name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = var.tags
}