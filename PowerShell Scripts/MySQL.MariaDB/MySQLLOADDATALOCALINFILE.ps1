#
#First of all, to interact with a MySQL or MariaDB database, we need the MySQL connector.
#
#The line above show how we load the dll to use in script
[void][system.reflection.Assembly]::LoadFrom(".\MySql.Data.dll")
#If u have installed the MySQL server, dependent of the version, the path of this ddl is in:
#   C:\Program Files (x86)\MySQL\Connector NET 8.0\Assemblies\v4.8\MySql.Data.dll
#
#The sequence of variables above is standard to configure the connector
$Mysqlhost= "1.2.3.4"
$Mysqluser= "user"
$Mysqldatabase= "database"
#
#This two lines is just to cryptograph the pass and give a minimum security
#
$pass= Read-Host "Database Password: " -AsSecureString
$Mysqlpass=[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
#
#To use the LOAD DATA LOCAL INFILE we need to enable the permission. To do this we add the parameter:
$AllowLoadLocalInfile="true"
#
#Create the Connection and prepare the SQL object
$Connection = [MySql.Data.MySqlClient.MySqlConnection]@{ConnectionString="server=$Mysqlhost;uid=$Mysqluser;pwd=$Mysqlpass;database=$Mysqldatabase;AllowLoadLocalInfile=$AllowLoadLocalInfile"}
$Connection.Open()
$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
$sql = $Connection.CreateCommand()
#
#Determining the query
#
$sql.CommandText='LOAD DATA LOCAL INFILE "'+$csvPath.replace("\","\\")+'" REPLACE INTO TABLE table CHARACTER SET UTF8 FIELDS TERMINATED BY "," LINES TERMINATED BY "\r\n" IGNORE 1 LINES (column1,column2,column3);'
#
#Executing the SQL Statement.
#
$sql.ExecuteNonQuery()
$Connection.Close()