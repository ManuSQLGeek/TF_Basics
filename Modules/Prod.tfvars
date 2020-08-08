resource_group_name = "tfProdrg"

location = "australiaeast"

sql_server_name = "tfProdserver"

SQL_Login = "sqladmin"

SQL_Password = "iergHVU%%$#^"

sql_db_name = "tfProddb"

sql_db_edition = "Standard"

requested_service_objective_name = "S0"

tags = {
    Environment = "Prod"
    Purpose = "TF Prod Presentation"
}

sqldbs = [
    {
        sql_db_name = "tfdb1"
        sql_db_edition = "Basic"
        requested_service_objective_name = "Basic"
    },
    {
        sql_db_name = "tfdb2"
        sql_db_edition = "Basic"
        requested_service_objective_name = "Basic"
    },
    {
        sql_db_name = "tfdb3"
        sql_db_edition = "Standard"
        requested_service_objective_name = "S0"
    }
    ]