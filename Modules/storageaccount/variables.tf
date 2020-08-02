variable "resource_group_name" {
  type        = string
  description = "(Optional) Resource Group Name is required if create_rg is false."
}

variable "sql_server_name" {
  type        = string
  description = "(Required) Specifies the SQL Server name"
}

variable "tags" {
  type        = map
  default     = {}
  description = "Set of base tags that will be associated with each supported resource."
}