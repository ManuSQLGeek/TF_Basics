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

module "storageaccount"{
    source = "./storageaccount"
    resource_group_name = azurerm_resource_group.example.name
    sql_server_name = var.sql_server_name
    tags = var.tags
}

module "SQLServer"{
    source = "./SQLServer"
    resource_group_name = azurerm_resource_group.example.name
    sql_server_name = var.sql_server_name
    SQL_Login = var.SQL_Login
    SQL_Password = var.SQL_Password
    tags = var.tags
}

module "SQLDB"{
    source = "./SQLDB"
    resource_group_name = azurerm_resource_group.example.name
    location = var.location
    sql_server_name = module.SQLServer.sql_server_name
    sql_db_name = var.sql_db_name
    sql_db_edition = var.sql_db_edition
    requested_service_objective_name = var.requested_service_objective_name
    tags = var.tags
}

module "SQLDBs"{
    source = "./SQLDBs"
    resource_group_name = azurerm_resource_group.example.name
    sql_server_name = module.SQLServer.sql_server_name
    sqldbs = var.sqldbs
    tags = var.tags
}