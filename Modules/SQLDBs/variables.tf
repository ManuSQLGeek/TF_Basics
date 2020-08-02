variable "resource_group_name" {
  type        = string
  default     = ""
  description = "(Optional) Resource Group Name is required if create_rg is false."
}

variable "sql_server_name" {
  type        = string
  description = "(Required) Specifies the SQL Server name"
}

# variable "sql_db_name" {
#   type        = string
#   description = "(Required) Specifies the SQL database name"
# }

# variable "sql_db_edition" {
#   type        = string
#   description = "(Required) Specifies the SQL database name"
# }

# variable "requested_service_objective_name" {
#   type        = string
#   description = "(Required) Specifies the SQL database name"
# }

variable "tags" {
  type        = map
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