resource_group_name = "tftestrg"

location = "australiaeast"

sql_server_name = "tftestserver"

SQL_Login = "sqladmin"

SQL_Password = "iergHVU%%$#^"

sql_db_name = "tftestdb"

sql_db_edition = "Standard"

requested_service_objective_name = "S0"

tags = {
    Environment = "Dev"
    Purpose = "TF Test Presentation"
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