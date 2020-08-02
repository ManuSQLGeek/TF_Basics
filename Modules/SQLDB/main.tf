provider "azurerm" {
  version = "=2.20.0"
  features {}
}

terraform {
  required_providers {
    azurerm = "~> 2.0"
  }
}

data "azurerm_sql_server" "example" {
  name = var.sql_server_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account" "example" {
  name = "${replace(lower(var.sql_server_name),"_","")}sa"
  resource_group_name = var.resource_group_name
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_db_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = data.azurerm_sql_server.example.name
  edition             = var.sql_db_edition
  requested_service_objective_name = var.requested_service_objective_name

  extended_auditing_policy {
    storage_endpoint                        = data.azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = data.azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = var.tags
}