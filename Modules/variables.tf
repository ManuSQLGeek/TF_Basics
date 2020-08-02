variable "resource_group_name" {
  type        = string
  description = "(Optional) Resource Group Name is required if create_rg is false."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "sql_server_name" {
  type        = string
  description = "(Required) Specifies the SQL Server name"
}

variable "SQL_Login" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
}

variable "SQL_Password" {
  type        = string
  description = "(Required) SQL Password"
}

variable "sql_db_name" {
  type        = string
  description = "(Required) Specifies the SQL database name"
}

variable "sql_db_edition" {
  type        = string
  description = "(Required) Specifies the SQL database name"
}

variable "requested_service_objective_name" {
  type        = string
  description = "(Required) Specifies the SQL database name"
}

variable "tags" {
  type        = map
  default     = {}
  description = "Set of base tags that will be associated with each supported resource."
}

variable sqldbs {
  type = list(
    object(
      {
        sql_db_name = string
        sql_db_edition = string
        requested_service_objective_name = string
      }
    )
  )
}