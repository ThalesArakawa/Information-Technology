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
#
#Create the Connection and prepare the SQL object
$Connection = [MySql.Data.MySqlClient.MySqlConnection]@{ConnectionString="server=$Mysqlhost;uid=$Mysqluser;pwd=$Mysqlpass;database=$Mysqldatabase"}
$Connection.Open()
$sql = New-Object MySql.Data.MySqlClient.MySqlCommand
$sql.Connection = $Connection
#
#Determining the query
#
$sql.CommandText='SELECT * FROM table;'
#
#Executing the query. In this case of SELECT statement we will put the data in a list and before export in a CSV file.
#
$csv = New-Object Collections.Generic.List[PSCustomObject]
$myreader = $sql.ExecuteReader()
while($myreader.Read()){ 

    $newRow = [PSCustomObject]@{
            "column1"=$myreader.GetString(0);
            "column2"=$myreader.GetString(1);
            "column3"=$myreader.GetString(2);
        }
        
    $csv.Add($newRow)
}
$csv | Export-Csv -Path 'table.csv' -Encoding utf8 -NoTypeInformation -UseQuotes Never -Force
$myreader.Close()
$Connection.Close()